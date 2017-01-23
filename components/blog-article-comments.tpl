<section class="comments content-area">
  <h2 class="comments__title">{{ "replies" | lcc: article.comments_count }}</h2>

  {% include "blog-article-comment-form" %}

  {% include "blog-article-comment-list" %}
</section>
