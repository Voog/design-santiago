{% if site.has_language_tags? %}
  <nav class="tags tags--centered">
    <svg class="tags__ico" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 14" width="14px" height="14px">
      <use xlink:href="#ico-tags"></use>
    </svg>

    <ul class="tags-nav">
      <li class="tags-nav__item">
        <a class="tags-nav__link tags-nav__item--separated{% unless tags.size > 0 %} tags-nav__link--current{% endunless %}" href="/{{ blog.page.path_with_lang }}/">{{ 'all_posts' | lc }}</a>
      </li>

      {% for tag in blog.tags %}
        {% assign current_class = "" %}

        {% for tmptag in tags %}
          {% if tmptag.name == tag.name %}
            {% assign current_class = "tags-nav__link--current" %}
          {% endif %}
        {% endfor %}

        <li class="tags-nav__item{% unless forloop.last %} tags-nav__item--separated{% endunless %}">
          {% if blog_pages_size == 1 %}
            {% assign blog_path = blog_first.path %}
          {% else %}
            {% assign blog_path = level_1.path %}
          {% endif %}

          <a class="tags-nav__link{% if current_class %} {{ current_class }}{% endif %}" href="/{{ blog.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
        </li>
      {% endfor %}
    </ul>
  </nav>
{% endif %}
