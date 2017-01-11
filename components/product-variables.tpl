{% capture dont_render %}
  {% unless page.image %}
    {% assign item_image_presence = false %}
  {% else %}
    {% assign item_image_presence = true %}

    {% if page.image.width > page.image.height %}
      {% assign item_image_orientation = "landscape" %}
    {% elsif page.image.width == page.image.height %}
      {% assign item_image_orientation = "square" %}
    {% else %}
      {% assign item_image_orientation = "portrait" %}
    {% endif %}

    {% if page.data.image_crop_state %}
      {% assign item_image_crop_state = page.data.image_crop_state %}
    {% else %}
      {% assign item_image_crop_state = false %}
    {% endif %}
  {% endunless %}
{% endcapture %}
