:root {
  /* VoogStyle
    "pathI18n": ["table"],
    "titleI18n": "padding",
    "editor": "rangePicker",
    "min": 0,
    "max": 200,
    "step": 1,
    "unit": "px",
    "scope": "global"
  */
  --content-area-table__padding: 12px;
  /* VoogStyle
    "pathI18n": ["table"],
    "titleI18n": "size",
    "editor": "rangePicker",
    "min": 8,
    "max": 100,
    "unit": "px",
    "scope": "global"
  */
  --content-area-table__font-size: 16px;
  /* VoogStyle
    "pathI18n": ["table", "border"],
    "titleI18n": "style",
    "editor": "listPicker",
    "list": {{ base_border_style_set }},
    "featured": true,
    "scope": "global"
  */
  --content-area-table__border-style: solid;
  /* VoogStyle
    "pathI18n": ["table", "border"],
    "titleI18n": "color",
    "editor": "colorPicker",
    "featured": true,
    "scope": "global"
  */
  --content-area-table__border-color: #000;
  /* VoogStyle
    "pathI18n": ["table", "border"],
    "titleI18n": "opacity",
    "editor": "rangePicker",
    "min": 0.1,
    "max": 1,
    "step": 0.1,
    "unit": "",
    "scope": "global",
    "boundVariables": [
      "--menu-main-hover__opacity"
    ]
  */
  --content-area-table__border-opacity: .1;
}
