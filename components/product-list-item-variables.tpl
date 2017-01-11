{% capture dont_render %}
  {% unless menu_level.image %}
    {% assign item_image_state = "without-image" %}
  {% else %}
    {% assign item_image_state = "with-image" %}

    {% if menu_level.image.width > menu_level.image.height %}
      {% assign item_image_orientation = "image-landscape" %}
    {% elsif menu_level.image.width == menu_level.image.height %}
      {% assign item_image_orientation = "image-square" %}
    {% else %}
      {% assign item_image_orientation = "image-portrait" %}
    {% endif %}

    {% if menu_level.data.image_crop_state %}
      {% assign item_image_crop_state = menu_level.data.image_crop_state %}
    {% else %}
      {% assign item_image_crop_state = "not-cropped" %}
    {% endif %}
  {% endunless %}
{% endcapture %}
