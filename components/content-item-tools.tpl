{% comment %}[[ TEMPLATE TOOLS RELATED JAVASCRIPT ]]{% endcomment %}
{% comment %}Adds template specific JS tools.{% endcomment %}
{% editorjsblock %}
  <script src="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js"></script>

  <script>
    template.bindContentItemBgPickers();
    template.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc }}');
    template.bindContentItemImageCropToggle();

    {%if site.data.settings_root_item %}
      rootItemValuesObj = {{ site.data.settings_root_item | json }};
    {% else %}
      rootItemValuesObj = {};
    {% endif %};

    template.bindRootItemSettings(rootItemValuesObj);
  </script>
{% endeditorjsblock %}
