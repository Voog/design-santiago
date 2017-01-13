<!DOCTYPE html>
{% include "template-variables" %}

<html class="layout-root" lang="{{ page.language_code }}" data-state--view-mode="{{ view_mode }}" data-state--menu-main="closed">
  <head prefix="og: http://ogp.me/ns#">
    {% include "template-head" %}
  </head>

  <body class="layout-container">
    <div class="layout-wrap">
      {% include "layout-header" %}

      <div class="layout-body layout-body--narrow layout-body--padded">
        {% include "menu-sub" %}

        <main class="content-area">{% content %}</main>
      </div>

      {% include "layout-footer" %}
    </div>

    {% include "template-javascripts" %}
  </body>
</html>
