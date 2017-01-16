{% comment %}Site search settings are located in "sources/javascript/base.js" file –> "bindSiteSearch" function.{% endcomment %}
{% if site.search.enabled %}
  <button class="site-search-btn js-toggle-site-search" data-sideclick="prevent">
    <svg class="search-ico" width="18" height="19" viewBox="0 0 18 19" xmlns="http://www.w3.org/2000/svg">
      <use xlink:href="#ico-search"></use>
    </svg>
  </button>

  <div class="site-search" data-sideclick="prevent">
    <form class="search-form js-search-form" method="get">
      <input class="search-input js-search-input" type="search" placeholder="{{ 'search' | lc }}...">
      <svg class="search-clear js-clear-search-input" width="20" height="20" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
        <use xlink:href="#ico-clear"></use>
      </svg>
    </form>

    <div class="voog-search-modal js-voog-search-modal"></div>
  </div>
{% endif %}
