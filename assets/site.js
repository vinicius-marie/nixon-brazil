(() => {
  const button = document.querySelector('.menu-btn');
  const nav = document.querySelector('.nav-links');
  if (button && nav) {
    button.addEventListener('click', () => {
      const open = nav.classList.toggle('open');
      button.setAttribute('aria-expanded', String(open));
    });
  }

  const search = document.querySelector('[data-archive-search]');
  const records = [...document.querySelectorAll('[data-record]')];
  const filters = [...document.querySelectorAll('[data-filter]')];
  let active = 'todos';

  const normalize = (value) => value.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  const apply = () => {
    const q = normalize(search?.value || '');
    let visible = 0;
    records.forEach((record) => {
      const text = normalize(record.textContent || '');
      const category = record.dataset.category || '';
      const show = (!q || text.includes(q)) && (active === 'todos' || category === active);
      record.hidden = !show;
      if (show) visible++;
    });
    const count = document.querySelector('[data-result-count]');
    if (count) count.textContent = `${visible} registro${visible === 1 ? '' : 's'}`;
  };

  search?.addEventListener('input', apply);
  filters.forEach((filter) => filter.addEventListener('click', () => {
    active = filter.dataset.filter || 'todos';
    filters.forEach((item) => item.classList.toggle('active', item === filter));
    apply();
  }));
  apply();
})();
