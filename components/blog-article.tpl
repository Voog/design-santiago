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
    <div class="content-area content-area--article-excerpt content-area--overflowed-images"{% unless list_item %} {{ edy_intro_edit_text }}{% endunless %}>{% if list_item %}{{ article.excerpt }}{% else %}{% editable article.excerpt %}{% endif %}</div>

    {% if list_item %}
      <a class="article__read-more" href="{{ article.url }}">{{ "read_more" | lc }}</a>
    {% endif %}

    {% unless list_item %}
      <div class="content-area content-area--article-body content-area--overflowed-images">{% editable article.body %}</div>

      <div class="content-area content-area--article-additional-body content-area--overflowed-images">{% content name="additional_body" bind="Article" %}</div>
    {% endunless %}
  </div>
</article>
