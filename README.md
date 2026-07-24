# Nixon Brasil

Site independente em português sobre a vida, a Presidência, a política externa e o legado de Richard Nixon.

## Site

https://viniciusdaniel-law.github.io/nixon-brasil/

## O que tem aqui

- páginas sobre biografia, Presidência, política externa e Nixon no Brasil
- artigos em Markdown
- acervo com links para fontes
- painel de edição (Pages CMS)
- RSS e sitemap
- notas para Instagram, X e legendagem de vídeo
- publicação automática no GitHub Pages

## Pastas principais

```text
src/pages/           páginas do site
src/content/artigos/ artigos
src/content/documentos/  acervo
src/components/      cabeçalho e rodapé
src/layouts/         layout base
public/uploads/      imagens do CMS
.pages.yml           config do painel
```

## Rotas

- `/` — início
- `/biografia/`
- `/presidencia/`
- `/politica-externa/`
- `/brasil/`
- `/artigos/`
- `/acervo/`
- `/videos/`
- `/sobre/`

## Documentação

- [`docs/CMS.md`](docs/CMS.md) — como editar no Pages CMS
- [`docs/OPERACAO-SOCIAL.md`](docs/OPERACAO-SOCIAL.md) — redes
- [`docs/TRADUCAO-DE-VIDEO.md`](docs/TRADUCAO-DE-VIDEO.md) — legendagem
- [`SECURITY.md`](SECURITY.md) — segurança

## Desenvolvimento

```bash
npm install
npm run dev
npm run build
```

Push na `main` gera build e deploy no GitHub Pages. PRs só compilam.

## Situação

Projeto independente, sem vínculo com a Richard Nixon Foundation, a Nixon Library ou a NARA.
