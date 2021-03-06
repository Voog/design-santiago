<div class="comment-form{% unless comment.valid? %} form_with_errors{% endunless %}">
  {% commentform %}
    {% include "blog-comment-form-variables" %}

    <div class="comment-form__field{% if comment_body_error %} form_field_with_errors{% endif %}">
      <textarea id="comment-form__body" class="comment-form__textarea form_field_textarea form_field_size_large" data-group="comment-field" data-init="auto-resize" data-behavior="toggle-comment-form-fields" name="comment[body]" rows="1" placeholder="{% if article.comments_count == 0 %}{{ 'write_first_comment' | lc }}{% else %}{{ 'comment' | lc }}{% endif %}">{{ comment.body }}</textarea>
    </div>

    <div id="comment-form__details" class="comment-form__details" data-display-state="{% if comment.valid? %}none{% else %}block{% endif %}">
      <div class="comment-form__inputs">
        <div class="comment-form__field comment-form__field--inline{% if comment_name_error %} form_field_with_errors{% endif %}">
          <input id="comment-form__name" class="form_field_textfield form_field_size_large" data-group="comment-field" data-behavior="toggle-comment-form-fields" name="comment[author]" value="{{ comment.author }}" placeholder="{{ 'name' | lc }}">
        </div>

        <div class="comment-form__field comment-form__field--inline{% if comment_email_error %} form_field_with_errors{% endif %}">
          <input id="comment-form__email" class="form_field_textfield form_field_size_large" data-group="comment-field" data-behavior="toggle-comment-form-fields" name="comment[author_email]" value="{{ comment.author_email }}" placeholder="{{ 'email' | lc }}">
        </div>
      </div>

      <div class="comment-form__btns form_submit">
        <input class="comment-form__btn" type="submit" value="{{ "submit" | lc }}">
      </div>
    </div>
  {% endcommentform %}
</div>
