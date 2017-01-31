{% comment %}Site search settings are located in "sources/javascript/base.js" file –> "bindSiteSearch" function.{% endcomment %}
{% if site.search.enabled %}
  <button class="site-search-btn js-toggle-site-search" data-sideclick="prevent">
    <svg class="search-ico--small" width="33" height="33" viewBox="0 0 33 33" xmlns="http://www.w3.org/2000/svg">
      <path d="M18.633 6.21a8.756 8.756 0 0 1 2.571 6.211 8.766 8.766 0 0 1-1.924 5.484l.96.962a1.67 1.67 0 0 1 1.444.462l4.327 4.327c.326.326.489.752.486 1.177a1.664 1.664 0 0 1-2.84 1.177l-4.327-4.327a1.666 1.666 0 0 1-.462-1.443l-.961-.962c-3.45 2.763-8.498 2.55-11.695-.647a8.75 8.75 0 0 1-2.571-6.21 8.783 8.783 0 0 1 14.992-6.21zM17.26 7.585a6.796 6.796 0 0 0-4.837-2.005 6.807 6.807 0 0 0-4.838 2.005 6.807 6.807 0 0 0-2.004 4.837c0 1.826.71 3.544 2.004 4.838a6.794 6.794 0 0 0 4.835 2.002c1.83 0 3.547-.713 4.838-2.005a6.794 6.794 0 0 0 2.004-4.837c0-1.826-.71-3.544-2.002-4.835z"/>
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
