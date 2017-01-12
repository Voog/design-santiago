<section id="article-comments" class="article-comments inner content-area">
  <h2 class="article-comments__title">{{ "replies" | lcc: article.comments_count }}</h2>

  <div class="comment-form{% unless comment.valid? %} form_with_errors{% endunless %}">
    {% commentform %}
      {% include "blog-article-variables" %}

      <div class="comment-form__field{% if comment_body_error %} form_field_with_errors{% endif %}">
        <textarea id="comment-body" class="form_field_textarea form_field_size_large" data-js-selector="comment-body" data-js-class="comment-field" data-behavior="toggle-comment-form-fields" name="comment[body]" rows="1" placeholder="{% if article.comments_count == 0 %}{{ 'write_first_comment' | lc }}{% else %}{{ 'comment' | lc }}{% endif %}">{{ comment.body }}</textarea>
      </div>

      <div class="comment-form__details" data-js-selector="comment-form-details" data-state--display="{% if comment.valid? %}none{% else %}block{% endif %}">
        <div class="comment-form__inputs">
          <div class="comment-form__field comment-form__field--inline{% if comment_name_error %} form_field_with_errors{% endif %}">
            <input id="comment-name" class="form_field_textfield form_field_size_large" data-js-selector="comment-form-name" data-js-class="comment-field" data-behavior="toggle-comment-form-fields" name="comment[author]" value="{{ comment.author }}" placeholder="{{ 'name' | lc }}">
          </div>

          <div class="comment-form__field comment-form__field--inline{% if comment_email_error %} form_field_with_errors{% endif %}">
            <input id="comment-email" class="form_field_textfield form_field_size_large" data-js-selector="comment-form-email" data-js-class="comment-field" data-behavior="toggle-comment-form-fields" name="comment[author_email]" value="{{ comment.author_email }}" placeholder="{{ 'email' | lc }}">
          </div>
        </div>

        <div class="comment-form__btns form_submit">
          <input class="comment-form__btn" type="submit" value="{{ "submit" | lc }}">
        </div>
      </div>
    {% endcommentform %}
  </div>

  {% if article.comments_count > 0 %}
    <div class="comments-list">
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
