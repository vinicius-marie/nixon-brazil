import { defineConfig } from 'astro/config';

const repository = 'nixon-brazil';
const customDomain = process.env.CUSTOM_DOMAIN;

export default defineConfig({
  site: customDomain ? `https://${customDomain}` : 'https://vinicius-marie.github.io',
  base: customDomain ? '/' : `/${repository}`,
  trailingSlash: 'always',
  output: 'static',
});
