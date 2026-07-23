# Segurança

## Arquitetura

O Nixon Brasil é gerado como site estático. Não possui banco de dados público, sessão de usuário, formulário de autenticação, chave de API ou execução de código no servidor.

## Segredos

Nunca adicionar ao repositório ou ao frontend:

- senhas;
- tokens do GitHub;
- chaves de APIs;
- credenciais SMTP;
- segredos OAuth;
- dados pessoais de assinantes.

Segredos futuros devem ser armazenados apenas em **Settings → Secrets and variables → Actions**.

## CMS

O Pages CMS autentica pelo GitHub. A capacidade de editar depende das permissões concedidas ao usuário no repositório. Visitantes do site não recebem acesso de escrita.

## Relato de vulnerabilidade

Não abra uma issue pública contendo credenciais ou dados sensíveis. Use contato privado com o mantenedor do repositório.
