<article class="article">
  <header class="article__header">
    <h1 class="article__title">
      {% if list_item %}
        <a class="article__link" href="{{ article.url }}">{{ article.title }}</a>
      {% else %}
        {% editable article.title %}
      {% endif %}
    </h1>

    <time class="article__date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: "long" }}</time>
  </header>

  <div class="article__content" data-search-indexing-allowed="true">
    <div class="article__excerpt">
      <div class="content-area content-area--overflowed-images"{% unless list_item %} {{ edy_intro_edit_text }}{% endunless %}>{% if list_item %}{{ article.excerpt }}{% else %}{% editable article.excerpt %}{% endif %}</div>
    </div>

    {% unless list_item %}
      <div class="article__body">
        <div class="content-area content-area--overflowed-images">{% if list_item %}{{ article.body }}{% else %}{% editable article.body %}{% endif %}</div>
      </div>
    {% endunless %}
  </div>
</article>
