export function GET({ site }: { site: URL }) {
  const base = import.meta.env.BASE_URL;
  const sitemap = new URL(`${base}sitemap.xml`, site).toString();
  return new Response(`User-agent: *\nAllow: /\n\nSitemap: ${sitemap}\n`, {
    headers: { 'Content-Type': 'text/plain; charset=utf-8' },
  });
}
