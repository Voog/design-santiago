{% comment %}
================================================================================
ARTICLE TOOLS RELATED JAVASCRIPT.
Adds article specific JS tools.
================================================================================
{% endcomment %}

{% editorjsblock %}
  <script>
    template.bindBgPickers();
    template.bindImgDropAreas();
    template.bindArticleImageCropToggle();
  </script>
{% endeditorjsblock %}
