{% comment %}Site search settings are located in "sources/javascript/base.js" file –> "bindSiteSearch" function.{% endcomment %}
{% if site.search.enabled %}
  <button class="site-search-btn js-toggle-site-search" data-sideclick="prevent">
    <svg class="search-ico--small" width="18" height="19" viewBox="0 0 18 19" xmlns="http://www.w3.org/2000/svg">
      <use xlink:href="#ico-search--small"></use>
    </svg>
  </button>

  <div class="site-search" data-sideclick="prevent">
    <svg class="search-ico--large" width="136" height="144" viewBox="0 0 136 144" xmlns="http://www.w3.org/2000/svg">
      <use xlink:href="#ico-search--large"></use>
    </svg>

    <form class="search-form js-search-form" method="get">
      <div class="search-input-container">
        <input class="search-input js-search-input" type="search" placeholder="{{ 'search' | lc }}...">
      </div>

      <svg class="search-clear js-clear-search-input" width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <use xlink:href="#ico-clear"></use>
      </svg>
    </form>

    <div class="voog-search-modal js-voog-search-modal"></div>
  </div>
{% endif %}
