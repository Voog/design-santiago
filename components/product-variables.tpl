{% capture dont_render %}
  {% unless page.image %}
    {% assign page_image_state = "without-image" %}
  {% else %}
    {% assign page_image_state = "with-image" %}

    {% if page.image.width > page.image.height %}
      {% assign page_image_orientation = "image-landscape" %}
    {% elsif page.image.width == page.image.height %}
      {% assign page_image_orientation = "image-square" %}
    {% else %}
      {% assign page_image_orientation = "image-portrait" %}
    {% endif %}

    {% if page.data.image_crop_state %}
      {% assign page_image_crop_state = page.data.image_crop_state %}
    {% else %}
      {% assign page_image_crop_state = "not-cropped" %}
    {% endif %}
  {% endunless %}
{% endcapture %}
