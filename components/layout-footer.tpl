<footer class="layout-footer">
  <div class="layout-footer__container">
    <div class="layout-footer__section layout-footer__section--voog-reference">
      <div class="voog-reference">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
    </div>

    <div class="layout-footer__section layout-footer__section--wide layout-footer__section--body">
      <div class="content-area">{% xcontent name="footer" %}</div>
    </div>

    <div class="layout-footer__section layout-footer__section--narrow">
      <div class="content-area">{% xcontent name="footer_2" %}</div>
    </div>
  </div>
</footer>
