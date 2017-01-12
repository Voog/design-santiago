{% capture dont_render %}
  {% unless comment.valid? %}
      {% for error in comment.errors %}
        {% if error == "comment_author_blank" %}{% assign comment_name_error = true %}{% endif %}
        {% if error == "comment_email_blank" %}{% assign comment_email_error = true %}{% endif %}
        {% if error == "comment_body_blank" %}{% assign comment_body_error = true %}{% endif %}
      {%endfor %}
  {% endunless %}
{% endcapture %}
