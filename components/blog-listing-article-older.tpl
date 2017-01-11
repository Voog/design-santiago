<div class="blog-article-older">
  <h2 class="article-title">
    <a class="article-link" href="{{ article.url }}">
      <span>{{ article.title }}</span>
      <time class="article-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: "%Y" }}</time>
    </a>
  </h2>
</div>
