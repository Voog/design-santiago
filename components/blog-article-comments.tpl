<section id="article-comments" class="article-comments inner content-area">
  <h2 class="comments-title">{{ "replies" | lcc: article.comments_count }}</h2>

  <div class="comment-form{% unless comment.valid? %} form_with_errors{% endunless %}">
    {% commentform %}
      {% include "blog-article-variables" %}

      <div class="form_area">
        <div class="form_fields">
          <div class="form_field{% if comment_body_error %} form_field_with_errors{% endif %}">
            <textarea id="comment-body" class="form_field_textarea form_field_size_large js-comment-field js-comment-body" name="comment[body]" rows="1" placeholder="{% if article.comments_count == 0 %}{{ 'write_first_comment' | lc }}{% else %}{{ 'comment' | lc }}{% endif %}">{{ comment.body }}</textarea>
          </div>

          <div class="comment-form-details{% if comment.valid? %} is-hidden{% endif %} js-comment-form-details">
            <div>
              <div class="form_field form_field_inline{% if comment_name_error %} form_field_with_errors{% endif %}">
                <input id="comment-name" class="form_field_textfield form_field_size_large js-comment-field js-comment-name" name="comment[author]" value="{{ comment.author }}" placeholder="{{ 'name' | lc }}">
              </div>

              <div class="form_field form_field_inline{% if comment_email_error %} form_field_with_errors{% endif %}">
                <input id="comment-email" class="form_field_textfield form_field_size_large js-comment-field js-comment-email" name="comment[author_email]" value="{{ comment.author_email }}" placeholder="{{ 'email' | lc }}">
              </div>
            </div>

            <div class="form_submit">
              <input type="submit" value="{{ "submit" | lc }}">
            </div>
          </div>
        </div>
      </div>
    {% endcommentform %}
  </div>

  {% if article.comments_count > 0 %}
    <div class="comments-listing">
      {% for comment in article.comments %}
        <div class="comment edy-site-blog-comment">

          <div class="comment-meta">
            <span class="comment-author">{{ comment.author }}</span>
            <span class="comment-date">{{ comment.created_at | format_date: "long" }}</span>
            {% if editmode %}
              <span class="comment-delete">{% removebutton %}</span>
            {% endif %}
          </div>

          <div class="comment-body">{{ comment.body_html }}</div>
        </div>
      {% endfor %}
    </div>
  {% endif %}
</section>
