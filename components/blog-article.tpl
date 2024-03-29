{% include "blog-settings-variables" %}
<article class="article">
  <header class="article__header">
    <h1 class="article__title">
      {% if list_item %}
        <a class="article__link" href="{{ article.url }}">{{ article.title }}</a>
      {% else %}
        {% editable article.title %}
      {% endif %}
    </h1>

    {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

    {% if article_year == current_year %}
      {% assign article_date_format = "long_without_year" %}
    {% else %}
      {% assign article_date_format = "long" %}
    {% endif %}

    {% if editmode or show_article_date != false %}
    <div>
      <time class="post-date formatted cfx{% if article_data_show_date_defined != true %} site-data{% endif %}{% if show_article_date == false %} hide-article-date{% endif %}" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
    </div>
    {% endif %}
  </header>

  <div class="article__content" data-search-indexing-allowed="true">
    <div class="content-area content-area--article-excerpt content-area--overflowed-images"{% unless list_item %} {{ edy_intro_edit_text }}{% endunless %}>{% if list_item %}{{ article.excerpt }}{% else %}{% editable article.excerpt %}{% endif %}</div>

    {% if list_item %}
      <a class="article__read-more-btn" href="{{ article.url }}">{{ "read_more" | lc }}</a>
    {% endif %}

    {% unless list_item %}
      <div class="content-area content-area--article-body content-area--overflowed-images">{% editable article.body %}</div>

      {%- assign bottom_content_title = "additional_content" | lce -%}
      {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
      <div class="content-area content-area--article-additional-body content-area--overflowed-images">{% content name="additional_body" bind="Article" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}</div>
    {% endunless %}
  </div>
</article>
