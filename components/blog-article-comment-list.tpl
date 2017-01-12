{% if article.comments_count > 0 %}
  <div class="comment-list">
    {% for comment in article.comments %}
      <div class="comment-list__item edy-site-blog-comment">

        <div class="comment-list__meta">
          <span class="comment-list__author">{{ comment.author }}</span>
          <span class="comment-list__date">{{ comment.created_at | format_date: "long" }}</span>
          {% if editmode %}
            <span class="comment-list__delete">{% removebutton %}</span>
          {% endif %}
        </div>

        <div class="comment-list__body">{{ comment.body_html }}</div>
      </div>
    {% endfor %}
  </div>
{% endif %}
