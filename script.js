const menuButton = document.querySelector('.menu-toggle');
const menu = document.querySelector('.main-nav');

menuButton?.addEventListener('click', () => {
  const open = menu.classList.toggle('open');
  menuButton.setAttribute('aria-expanded', String(open));
});

menu?.querySelectorAll('a').forEach((link) => {
  link.addEventListener('click', () => {
    menu.classList.remove('open');
    menuButton?.setAttribute('aria-expanded', 'false');
  });
});

const search = document.querySelector('#archive-search');
const items = [...document.querySelectorAll('#archive-list a')];
const empty = document.querySelector('#empty-state');

search?.addEventListener('input', () => {
  const query = search.value.toLocaleLowerCase('pt-BR').trim();
  let visible = 0;

  items.forEach((item) => {
    const haystack = `${item.dataset.search ?? ''} ${item.textContent}`.toLocaleLowerCase('pt-BR');
    const matches = !query || haystack.includes(query);
    item.hidden = !matches;
    if (matches) visible += 1;
  });

  empty.hidden = visible !== 0;
});
