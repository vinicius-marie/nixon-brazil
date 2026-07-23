# Nixon Brasil

Portal editorial independente sobre a vida, a Presidência, a política externa e o legado de Richard Nixon em português.

## Site

`https://vinicius-marie.github.io/nixon-brazil/`

## Produto

- portal institucional responsivo;
- artigos em Markdown;
- acervo de fontes primárias;
- CMS visual baseado em Git;
- RSS, sitemap e metadados sociais;
- documentação para Instagram, X e tradução de vídeo;
- deploy automático no GitHub Pages.

## Arquitetura

```text
Astro
├── src/pages/                rotas públicas
├── src/content/artigos/      publicação editorial
├── src/content/documentos/   acervo estruturado
├── src/components/           navegação e componentes
├── src/layouts/              layout e SEO
├── public/uploads/           mídia enviada pelo CMS
└── .pages.yml                configuração do painel
```

## Estrutura pública

- `/` — página inicial institucional
- `/biografia/` — vida, campanhas e retorno político
- `/presidencia/` — políticas internas e resultados
- `/politica-externa/` — China, détente e estratégia internacional
- `/brasil/` — relações Brasil–Estados Unidos e documentação bilateral
- `/artigos/` — ensaios e dossiês
- `/acervo/` — fontes primárias pesquisáveis
- `/videos/` — projeto de tradução e legendagem
- `/sobre/` — missão e critérios editoriais

## Operação editorial

- [`docs/CMS.md`](docs/CMS.md) — edição e publicação pelo Pages CMS
- [`docs/OPERACAO-SOCIAL.md`](docs/OPERACAO-SOCIAL.md) — Instagram, X, séries e cadência
- [`docs/TRADUCAO-DE-VIDEO.md`](docs/TRADUCAO-DE-VIDEO.md) — fluxo FOSS de transcrição, tradução, legendagem e exportação
- [`SECURITY.md`](SECURITY.md) — modelo de segurança e tratamento de segredos

## Desenvolvimento

```bash
npm install
npm run dev
npm run build
```

## Publicação

O GitHub Actions executa verificação de tipos, build estático e deploy no GitHub Pages a cada atualização da branch `main`. Pull requests são compiladas sem publicação.

## Situação institucional

Protótipo independente, sem vínculo atual com a Richard Nixon Foundation, Richard Nixon Presidential Library ou NARA.
