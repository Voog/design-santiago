{% include "product-list-item-variables" %}

{% if editmode %}
  <div class="content-item content-item--list-item" data-setting--bg-picker-component="parent" data-state--image-presence="{{ item_image_presence }}" data-setting--content-item-type="page" data-setting--content-item-id="{{ menu_level.page_id }}">
    <div class="content-item__cover-image" data-setting--bg-picker-component="area">
      <button class="btn btn--hover-toggleable btn--editor" data-setting--bg-picker-component="toggler" data-setting--bg-picker-key="image" data-setting--bg-picker-image-editor="true" data-setting--bg-picker-color-editor="false" data-setting--bg-picker-target-width="680" data-bg-image="{{ menu_level.image.for-width-680.url }}"></button>

      <button class="btn btn--hover-toggleable btn--toggler" data-state--display="{% if item_image_orientation == "image-square" or menu_level.image == nil %}none{% else %}block{% endif %}" data-behavior="toggle-crop-state">
        <svg width="45" height="45" viewBox="0 0 45 45" xmlns="http://www.w3.org/2000/svg">
          <use xlink:href="#ico-toggle"></use>
        </svg>
      </button>

      <div class="content-item__cover-image-inner content-item__cover-image--drop-area js-img-drop-area" data-setting--image-orientation="{{ item_image_orientation }}" data-setting--image-crop-state="{{ item_image_crop_state }}" data-image="{{ menu_level.image.for-width-680.url }}" data-aspect-ratio="inner"></div>
    </div>

    <h2 class="content-item__title">
      <a class="content-item__link" href="{{ menu_level.url }}">{{ menu_level.title }}</a>
    </h2>
  </div>
{% else %}
  <a class="content-item content-item--list-item {{ item_image_state }} js-content-item" href="{{ menu_level.url }}">
    <div class="content-item__cover-image">
      <div class="content-item__cover-image-inner">
        {% if menu_level.image %}
          <div class="loader js-loader"></div>
          <img class="item-image {{ item_image_orientation }} {{ item_image_crop_state }} js-lazyload" data-original="{{ menu_level.image.for-width-680.url }}">
        {% else %}
          <div class="item-placeholder">{{ menu_level.title | truncate: 50 }}</div>
        {% endif %}
      </div>
    </div>

    <h2 class="item-title">{{ menu_level.title }}</h2>
  </a>
{% endif %}
