<section class="comments">
  <h2 class="comments__title">{{ "replies" | lcc: article.comments_count }}</h2>

  <div class="content-area">
    {% include "blog-article-comment-form" %}

    {% include "blog-article-comment-list" %}
  </div>
</section>
