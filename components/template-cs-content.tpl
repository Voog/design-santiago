:root {
  {% unless page.layout_title == product_list_layout %}
  /* VoogStyle
    "pathI18n": ["{{ content_container_title }}"],
    "titleI18n": "maximum_width",
    "editor": "rangePicker",
    "min": 600,
    "max": 2000,
    "step": 5,
    "unit": "px",
    "scope": "global"
  */
  --layout-body-narrow__max-width: 960px;
  {% endunless %}
  /* VoogStyle
    "pathI18n": ["{{ content_container_title }}"],
    "titleI18n": "padding",
    "editor": "rangePicker",
    "min": 0,
    "max": 200,
    "step": 1,
    "unit": "px",
    "scope": "global"
  */
  --layout-body-narrow__padding: 0;
  /* VoogStyle
    "pathI18n": ["{{ content_container_title }}"],
    "titleI18n": "background_color",
    "editor": "colorPicker",
    "scope": "global"
  */
  --layout-body-narrow__background-color: transparent;
  {% if content_inner_title == "product" %}
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "alignment",
    "editor": "listPicker",
    "list": {{ base_alignment_set }},
    "scope": "global"
  */
  --content-area-product-title__text-alignment: left;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 100,
    "unit": "px",
    "scope": "global"
  */
  --content-area-product-title__font-size: 72px;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "font_size",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "700",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-area-product-title__font-weight: 700;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-area-product-title__font-style: normal;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-area-product-title__text-decoration: none;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-area-product-title__text-transform: none;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "featured": true,
    "scope": "global"
  */
  --content-area-product-title__color: #ed1c24;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}"],
    "titleI18n": "image_radius",
    "editor": "rangePicker",
    "min": 0,
    "max": 100,
    "step": 1,
    "unit": "%",
    "scope": "global"
  */
  --content-item-box__image-radius: 0;
  {% endif %}
  {% if content_container_title == "blog" or content_container_title == "article" %}
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 100,
    "unit": "px",
    "featured": true,
    "scope": "global"
  */
  --content-area-article-title__font-size: 28px;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "font_size",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "700",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-area-article-title__font-weight: 700;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-area-article-title__font-style: normal;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-area-article-title__text-decoration: none;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-area-article-title__text-transform: uppercase;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "title"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "featured": true,
    "scope": "global"
  */
  --content-area-article-title__color: #ed1c24;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "date"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 100,
    "unit": "px",
    "featured": true,
    "scope": "global"
  */
  --content-area-article-date__font-size: 12px;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "date"],
    "titleI18n": "opacity",
    "editor": "rangePicker",
    "min": 0.1,
    "max": 1,
    "step": 0.1,
    "unit": "",
    "scope": "global"
  */
  --content-area-article-date__opacity: .5;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "date"],
    "titleI18n": "font_size",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "700",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-area-article-date__font-weight: 400;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "date"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-area-article-date__font-style: normal;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "date"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-area-article-date__text-decoration: none;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "date"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-area-article-date__text-transform: none;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "date"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "featured": true,
    "scope": "global"
  */
  --content-area-article-date__color: #000;
  {% endif %}
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "text"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 100,
    "unit": "px",
    "featured": true,
    "scope": "global"
  */
  --content-area-text__font-size: 20px;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "text"],
    "titleI18n": "color",
    "editor": "colorPicker",
    "featured": true,
    "scope": "global"
  */
  --content-area-text__color: #000;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "normal"],
    "titleI18n": "font_weight",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "700",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global",
    "boundVariables": [
      "--content-area-link-hover__font-weight"
    ]
  */
  --content-area-link__font-weight: 400;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "hover"],
    "titleI18n": "font_size",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "700",
      "off": "400"
    },
    "icon": "bold",
    "scope": "global"
  */
  --content-area-link-hover__font-weight: 400;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "normal"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global",
    "boundVariables": [
      "--content-area-link-hover__font-style"
    ]
  */
  --content-area-link__font-style: normal;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "hover"],
    "titleI18n": "font_style",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "italic",
      "off": "normal"
    },
    "icon": "italic",
    "scope": "global"
  */
  --content-area-link-hover__font-style: normal;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "normal"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-area-link__text-decoration: underline;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "hover"],
    "titleI18n": "text_decoration",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "underline",
      "off": "none"
    },
    "icon": "underline",
    "scope": "global"
  */
  --content-area-link-hover__text-decoration: none;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "normal"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global",
    "boundVariables": [
      "--content-area-link-hover__text-transform"
    ]
  */
  --content-area-link__text-transform: none;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "hover"],
    "titleI18n": "text_transform",
    "type": "button",
    "editor": "toggleIcon",
    "states": {
      "on": "uppercase",
      "off": "none"
    },
    "icon": "uppercase",
    "scope": "global"
  */
  --content-area-link-hover__text-transform: none;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "normal"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "featured": true,
    "scope": "global",
    "boundVariables": [
      "--content-area-link-hover__color"
    ]
  */
  --content-area-link__color: #ed1c24;
  /* VoogStyle
    "pathI18n": ["{{ content_inner_title }}", "link", "hover"],
    "titleI18n": "color",
    "type": "button",
    "editor": "colorPicker",
    "scope": "global"
  */
  --content-area-link-hover__color: #ed1c24;
}
