{% comment %}Site search settings are located in "sources/javascript/base.js" file –> "bindSiteSearch" function.{% endcomment %}
{% if site.search.enabled %}
  <button class="site-search-btn js-toggle-site-search" data-sideclick="prevent">
    <svg class="search-ico--small" width="28" height="28" viewBox="4 4 28 28" xmlns="http://www.w3.org/2000/svg">
      <path d="M22.624 7.541a10.633 10.633 0 0 1 3.123 7.542 10.645 10.645 0 0 1-2.338 6.66l1.168 1.167a2.028 2.028 0 0 1 1.752.56l5.255 5.255c.395.396.593.914.59 1.43a2.021 2.021 0 0 1-3.449 1.43l-5.254-5.256a2.022 2.022 0 0 1-.561-1.752l-1.168-1.168c-4.188 3.356-10.32 3.096-14.2-.785a10.626 10.626 0 0 1-3.124-7.541c0-2.73 1.042-5.46 3.123-7.542 4.165-4.164 10.918-4.164 15.083 0zm-1.667 1.667a8.253 8.253 0 0 0-5.874-2.433 8.266 8.266 0 0 0-5.875 2.433 8.266 8.266 0 0 0-2.433 5.875c0 2.217.862 4.303 2.433 5.874a8.25 8.25 0 0 0 5.872 2.43 8.25 8.25 0 0 0 5.874-2.433 8.25 8.25 0 0 0 2.434-5.874 8.25 8.25 0 0 0-2.431-5.872z"/>
    </svg>
  </button>

  <div class="site-search" data-sideclick="prevent">
    <svg class="search-ico--large" width="251" height="250" viewBox="-49 -14 251 250" xmlns="http://www.w3.org/2000/svg">
      <path d="M96.154 34.235c13.269 13.268 19.911 30.675 19.911 48.083-.017 15.04-4.973 30.08-14.903 42.462l7.443 7.444c3.952-.614 8.142.545 11.173 3.576l33.504 33.504a12.772 12.772 0 0 1 3.764 9.112c0 3.305-1.243 6.592-3.764 9.113-5.025 5.024-13.184 5.041-18.225 0l-33.503-33.504c-3.032-3.031-4.208-7.238-3.577-11.173l-7.444-7.443c-26.707 21.393-65.797 19.74-90.545-5.008-13.286-13.285-19.912-30.676-19.912-48.083 0-17.408 6.643-34.815 19.912-48.083C26.542 7.68 69.6 7.68 96.154 34.235zM85.526 44.863C75.51 34.848 62.208 29.346 48.07 29.346c-14.154.017-27.457 5.519-37.455 15.517-9.998 9.998-15.5 23.3-15.517 37.455 0 14.137 5.502 27.44 15.517 37.455 9.998 9.998 23.3 15.5 37.438 15.5 14.171 0 27.457-5.52 37.455-15.517 9.998-9.999 15.516-23.284 15.516-37.455 0-14.137-5.501-27.44-15.5-37.438z"/>
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
