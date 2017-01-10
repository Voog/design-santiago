<article class="blog-article">
  <header class="blog-article__header">
    <h1 class="blog-article__title">
      {% if list_item %}<a class="blog-article__link" href="{{ article.url }}">{% endif %}
        {{ article.title }}</h1>
      {% if list_item %}</a>{% endif %}
    <time class="blog-article__date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: "long" }}</time>
  </header>

  <div class="blog-article__content" data-search-indexing-allowed="true">
    <div class="blog-article__excerpt content-area">{{ article.excerpt }}</div>

    {% unless list_item %}
      <div class="blog-article__body content-area">{{ article.body }}</div>
    {% endunless %}
  </div>
</article>
