<!DOCTYPE html>
{% include "template-variables" layout_blog_article: true %}
{% include "blog-article-variables" %}
{% include "blog-settings-variables" %}

<html class="layout-root {{ language_flags_mode }} {{ language_names_mode }} {{ language_menu_mode }} {{ site_search_mode }}" lang="{{ page.language_code }}" data-view-state="{{ view_mode }}" data-lingual-mode="{{ site_lingual_mode }}" data-menu-main-state="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container">
    {% include "template-svg-spritesheet" %}

    <div class="layout-wrap">
      {% include "layout-header" %}
      

      <div class="layout-body layout-body--narrow">
        
          {% if editmode %}
            {% include "article-settings-editor" %}
          {% endif %}
        <main class="layout-body__content">
          {% include "blog-article" %}

          {% include "blog-article-tags" %}

          {% include "blog-article-navigation" %}

          {% if editmode or show_article_comments == true %}
            <section class="post-bottom formatted cfx"{% if editmode and show_article_comments == false %} style="display: none;"{% endif %}>
              {% include "blog-article-comments" %}
            </section>
          {% endif %}  
        </main>
      </div>

      {% include "layout-footer" %}

      {% if show_language_menu_popover %}
        {% include "menu-language-popover" %}
      {% endif %}
    </div>

    {% include "site-signout" %}
    {% include "template-javascripts" %}
  </body>
</html>
