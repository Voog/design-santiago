{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<nav class="menu-sub menu-breadcrumbs content-formatted">
  <ul class="menu-sub__list">
    {%- for listItem in breadcrumbsObj.itemListElement %}
      {%- assign pageUrl = page.url | remove_first: "/" -%}
      <span class="menu-sub__separator">/</span>
      <li class="menu-sub__item--selected menu-sub__item {% if pageUrl == listItem.item.id %} menu-sub__item--current{% endif %}">
        <a class="menu-link" href="/{{listItem.item.id}}">{{ listItem.item.name }}</a>
      </li>
    {% endfor -%}
  </ul>
</nav>
