(function () {
  var lang = localStorage.getItem('flb_lang') || 'zh';
  document.documentElement.className = 'lang-' + lang;
  document.documentElement.lang = lang === 'en' ? 'en' : 'zh-CN';
})();

function flbToggleLang() {
  var next = document.documentElement.classList.contains('lang-en') ? 'zh' : 'en';
  localStorage.setItem('flb_lang', next);
  document.documentElement.className = 'lang-' + next;
  document.documentElement.lang = next === 'en' ? 'en' : 'zh-CN';
  document.dispatchEvent(new CustomEvent('flblang', { detail: next }));
}
