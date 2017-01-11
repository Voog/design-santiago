<article class="blog-article">
  <header class="blog-article__header">
    <h1 class="blog-article__title">
      {% if list_item %}
        <a class="blog-article__link" href="{{ article.url }}">{{ article.title }}</a>
      {% else %}
        {% editable article.title %}
      {% endif %}
    </h1>

    <time class="blog-article__date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: "long" }}</time>
  </header>

  <div class="blog-article__content" data-search-indexing-allowed="true">
    <div class="blog-article__excerpt">
      <div class="content-area content-area--font-unformatted">{% if list_item %}{{ article.excerpt }}{% else %}{% editable article.excerpt %}{% endif %}</div>
    </div>

    {% unless list_item %}
      <div class="blog-article__body">
        <div class="content-area content-area--font-unformatted">{% if list_item %}{{ article.body }}{% else %}{% editable article.body %}{% endif %}</div>
      </div>
    {% endunless %}
  </div>
</article>
