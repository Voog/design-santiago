{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<nav class="menu-sub menu-breadcrumbs content-formatted">
  <ul class="menu-sub__list">
    {%- for listItem in breadcrumbsObj.itemListElement %}
      {% if forloop.first and forloop.length > 2 %}
        {% continue %}
      {% endif %}
      <span class="menu-sub__separator">/</span>
      <li class="menu-sub__item--selected menu-sub__item{% if forloop.last %} menu-sub__item--current{% endif %}">
        <a class="menu-link" href="/{{listItem.item.id}}">{{ listItem.item.name }}</a>
      </li>
    {% endfor -%}
  </ul>
</nav>
