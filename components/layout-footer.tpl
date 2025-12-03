<footer class="layout-footer">
  <div class="layout-footer__container">
    {% if site.branding.enabled and page.path == blank %}
      <div class="layout-footer__section layout-footer__section--voog-reference">
        {% loginblock %}
          {{ "footer_login_link" | lc }}
        {% endloginblock %}
      </div>
    {% endif %}

    {%- assign footer_content_title = "footer" | lce -%}
    {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}
    <div class="layout-footer__section layout-footer__section--wide layout-footer__section--body">
      <div class="content-area">{% xcontent name="footer" title=footer_content_title title_tooltip=footer_content_title_tooltip %}</div>
    </div>

    <div class="layout-footer__section layout-footer__section--narrow layout-footer__section--social-media">
      <div class="content-area">{% xcontent name="footer_2" title_tooltip=footer_content_title_tooltip %}</div>
    </div>
  </div>
</footer>
