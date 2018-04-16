{% comment %}[[ TEMPLATE TOOLS RELATED JAVASCRIPT ]]{% endcomment %}
{% comment %}Adds template specific JS tools.{% endcomment %}
{% editorjsblock %}
  <script>
    template.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc: editor_locale | escape }}');
    template.bindContentItemImageCropToggle();

    {%if site.data.settings_root_item %}
      rootItemValuesObj = {{ site.data.settings_root_item | json }};
    {% else %}
      rootItemValuesObj = {};
    {% endif %};

    template.bindRootItemSettings(rootItemValuesObj);
  </script>
{% endeditorjsblock %}
