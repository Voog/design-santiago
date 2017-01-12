{% if article.older or article.newer %}
  <div class="article-nav">
    <div class="article-nav__inner">
      {% if article.older %}
        <a class="article-nav__link {% if article.newer %}article-nav__link--half{% else %}article-nav__link--full{% endif %} article-nav__link--older" href="{{ article.older.url }}">
          <div class="article-nav__direction">{{ "previous" | lc }}</div>
          <div class="article-nav__title">{{ article.older.title }}</div>
        </a>
      {% endif %}

      {% if article.newer %}
        <a class="article-nav__link {% if article.older %}article-nav__link--half{% else %}article-nav__link--full{% endif %} article-nav__link--newer" href="{{ article.newer.url }}">
          <div class="article-nav__direction">{{ "next" | lc }}</div>
          <div class="article-nav__title">{{ article.newer.title }}</div>
        </a>
      {% endif %}
    </div>
  </div>
{% endif %}
