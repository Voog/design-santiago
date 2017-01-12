{% if editmode %}
  <div class="tags">
    <svg class="tags__ico" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 14" width="14px" height="14px">
      <use xlink:href="#ico-tags"></use>
    </svg>

    {% editable article.tags %}
  </div>
{% elsif article.tags != empty %}
  <nav class="tags">
    <svg class="tags__ico" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 14" width="14px" height="14px">
      <use xlink:href="#ico-tags"></use>
    </svg>

    <ul class="tags-nav">
      {% for tag in article.tags %}
        <li class="tags-nav__item{% unless forloop.last %} tags-nav__item--separated{% endunless %}">
          <a class="tags-nav__link" href="/{{ article.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
        </li>
      {% endfor %}
    </ul>
  </nav>
{% endif %}
