# Painel editorial — Pages CMS

## Acesso

1. Abra `https://app.pagescms.org/`.
2. Entre com a conta GitHub proprietária do repositório.
3. Autorize acesso somente a `viniciusdaniel-law/nixon-brazil`.
4. Selecione o repositório e a branch `main`.

O Pages CMS lê o arquivo `.pages.yml` e oferece duas coleções:

- **Artigos**
- **Documentos do acervo**

## Publicar artigo

1. Abra **Artigos → New entry**.
2. Preencha título, resumo, data, autor e categoria.
3. Adicione imagem, texto alternativo e crédito.
4. Escreva o texto no editor.
5. Deixe `Rascunho` ativo enquanto revisa.
6. Para publicar, desative `Rascunho` e salve.

A alteração vira um arquivo Markdown em `src/content/artigos/`. O GitHub Actions recompila o portal e publica a nova versão.

## Destacar na página inicial

Ative **Destacar na página inicial**. A home exibe até três artigos destacados, ordenados pela data de publicação.

## Adicionar documento ao acervo

Preencha:

- título editorial;
- título original;
- data;
- formato;
- tema;
- arquivo de origem;
- referência oficial;
- URL do original;
- situação da tradução;
- nota documental.

Não inventar códigos de arquivo. Use somente referências reais fornecidas pela instituição de custódia.

## Imagens

Uploads entram em `public/uploads/`. Antes de publicar, registrar:

- descrição visual adequada;
- fotógrafo ou órgão produtor;
- coleção;
- identificador, quando houver;
- licença ou situação de domínio público.

## Domínio próprio

Depois de configurar o domínio no GitHub Pages, crie uma variável de repositório:

`Settings → Secrets and variables → Actions → Variables → New repository variable`

Nome:

`CUSTOM_DOMAIN`

Valor de exemplo:

`nixonbrasil.org`

O build passará automaticamente a usar a raiz `/` em vez de `/nixon-brazil/`.
