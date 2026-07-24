[CmdletBinding()]
param(
    [string]$OldUser = 'vinicius-marie',
    [string]$NewUser = 'vinicius-daniel',
    [string]$OldRepo = 'nixon-brazil',
    [string]$NewRepo = 'nixon-brasil'
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Require-Command([string]$Name) {
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Comando ausente: $Name"
    }
}

Require-Command git
Require-Command gh
Require-Command node
Require-Command npm

if (-not (Test-Path '.git')) {
    throw 'Execute este script na raiz do clone local do repositório.'
}

Write-Host '1/8 Verificando autenticação do GitHub CLI...'
gh auth status | Out-Host
$currentUser = (gh api user --jq '.login').Trim()
if ($currentUser -ne $NewUser) {
    throw "A conta autenticada ainda é '$currentUser'. Primeiro altere manualmente o username no GitHub para '$NewUser' e execute novamente."
}

Write-Host '2/8 Atualizando o repositório no GitHub...'
$repoJson = gh repo view --json name,nameWithOwner | ConvertFrom-Json
$currentRepo = $repoJson.name
if ($currentRepo -ne $NewRepo) {
    gh api --method PATCH "repos/$NewUser/$currentRepo" -f "name=$NewRepo" | Out-Null
    Start-Sleep -Seconds 3
}

Write-Host '3/8 Atualizando o remote local...'
$newRemote = "https://github.com/$NewUser/$NewRepo.git"
git remote set-url origin $newRemote

Write-Host '4/8 Substituindo identidade e URLs em arquivos rastreados...'
$replacements = [ordered]@{
    $OldUser = $NewUser
    $OldRepo = $NewRepo
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$changed = New-Object System.Collections.Generic.List[string]

foreach ($relativePath in (git ls-files)) {
    if (-not (Test-Path -LiteralPath $relativePath -PathType Leaf)) { continue }
    if ($relativePath -eq 'scripts/migrate-github-identity.ps1') { continue }

    $bytes = [System.IO.File]::ReadAllBytes((Resolve-Path -LiteralPath $relativePath))
    if ($bytes -contains 0) { continue }

    $text = [System.Text.Encoding]::UTF8.GetString($bytes)
    $updated = $text
    foreach ($pair in $replacements.GetEnumerator()) {
        $updated = $updated.Replace([string]$pair.Key, [string]$pair.Value)
    }

    if ($updated -ne $text) {
        [System.IO.File]::WriteAllText((Resolve-Path -LiteralPath $relativePath), $updated, $utf8NoBom)
        $changed.Add($relativePath)
    }
}

Write-Host "Arquivos atualizados: $($changed.Count)"
$changed | ForEach-Object { Write-Host "  - $_" }

Write-Host '5/8 Instalando dependências e validando o portal...'
npm install --no-audit --no-fund
npm run check
npm run build

Write-Host '6/8 Verificando referências antigas restantes...'
$leftovers = git grep -n -I -e $OldUser -e $OldRepo -- . 2>$null
if ($LASTEXITCODE -eq 0 -and $leftovers) {
    $leftovers | Out-Host
    throw 'Ainda existem referências antigas. Nada foi enviado ao GitHub.'
}

Write-Host '7/8 Removendo este migrador de uso único e criando commit...'
Remove-Item -LiteralPath $PSCommandPath -Force
git add -A

if (-not (git diff --cached --quiet)) {
    $noreply = "242110551+$NewUser@users.noreply.github.com"
    git -c user.name='Vinícius Daniel' -c user.email=$noreply commit -m 'Migrate GitHub identity and Pages URLs'
    git push origin HEAD:main
} else {
    Write-Host 'Nenhuma mudança para enviar.'
}

Write-Host '8/8 Aguardando o workflow de publicação aparecer...'
$runId = $null
for ($i = 0; $i -lt 12; $i++) {
    Start-Sleep -Seconds 5
    $runId = gh run list --repo "$NewUser/$NewRepo" --workflow 'Publicar Nixon Brasil' --limit 1 --json databaseId --jq '.[0].databaseId' 2>$null
    if ($runId) { break }
}

if ($runId) {
    gh run watch $runId --repo "$NewUser/$NewRepo" --exit-status
} else {
    Write-Warning 'O push foi concluído, mas o workflow ainda não apareceu. Confira a aba Actions manualmente.'
}

Write-Host ''
Write-Host 'Migração concluída.' -ForegroundColor Green
Write-Host "Repositório: https://github.com/$NewUser/$NewRepo"
Write-Host "Site:        https://$NewUser.github.io/$NewRepo/"
