.layout-body {
  max-width: 1270px;
}
.layout-body__content {
  background-color: var(--layout-body-narrow__background-color);
}
@media (min-width: 641px) {
  .layout-body__content {
    padding: var(--layout-body-narrow__padding);
  }
}
.layout-body--narrow {
  max-width: var(--layout-body-narrow__max-width);
}

.menu-main__item:not(.menu-main__item--selected) a {
  font-style: var(--menu-main__font-style);
  font-weight: var(--menu-main__font-weight);
  color: var(--menu-main__color);
  text-transform: var(--menu-main__text-transform);
  opacity: var(--menu-main__opacity);
}
@media (min-width: 641px) {
  .menu-main__item:not(.menu-main__item--selected) a {
    border-bottom: var(--menu-main__text-decoration);
  }
}
.menu-main__item:not(.menu-main__item--selected) a:hover {
  font-style: var(--menu-main-hover__font-style);
  font-weight: var(--menu-main-hover__font-weight);
  color: var(--menu-main-hover__color);
  text-transform: var(--menu-main-hover__text-transform);
}
@media (min-width: 641px) {
  .menu-main__item:not(.menu-main__item--selected) a:hover {
    border-bottom: var(--menu-main-hover__text-decoration);
    opacity: var(--menu-main-hover__opacity);
  }
}
.menu-main__item--selected a {
  font-style: var(--menu-main-active__font-style);
  font-weight: var(--menu-main-active__font-weight);
  color: var(--menu-main-active__color);
  text-transform: var(--menu-main-active__text-transform);
  opacity: var(--menu-main-active__opacity);
}
@media (min-width: 641px) {
  .menu-main__item--selected a {
    border-bottom: var(--menu-main-active__text-decoration);
  }
}
@media (min-width: 641px) {
  .menu-main__item a {
    font-size: var(--menu-main__font-size);
  }
}

.menu-sub__item:not(.menu-sub__item--selected) a:not(.menu-sub__link--untranslated) {
  font-style: var(--menu-sub__font-style);
  font-weight: var(--menu-sub__font-weight);
  color: var(--menu-sub__color);
  text-decoration: var(--menu-sub__text-decoration);
  text-transform: var(--menu-sub__text-transform);
  opacity: var(--menu-sub__opacity);
}
.menu-sub__item:not(.menu-sub__item--selected) a:not(.menu-sub__link--untranslated):hover {
  font-style: var(--menu-sub-hover__font-style);
  font-weight: var(--menu-sub-hover__font-weight);
  color: var(--menu-sub-hover__color);
  text-decoration: var(--menu-sub-hover__text-decoration);
  text-transform: var(--menu-sub-hover__text-transform);
  opacity: var(--menu-sub-hover__opacity);
}
.menu-sub__item--selected a {
  font-style: var(--menu-sub-active__font-style);
  font-weight: var(--menu-sub-active__font-weight);
  color: var(--menu-sub-active__color);
  text-decoration: var(--menu-sub-active__text-decoration);
  text-transform: var(--menu-sub-active__text-transform);
  opacity: var(--menu-sub-active__opacity);
}
@media (min-width: 641px) {
  .menu-sub__item a {
    font-size: var(--menu-sub__font-size);
  }
}

.content-area {
  font-size: var(--content-area-text__font-size);
  color: var(--content-area-text__color);
}

.layout-body .content-area h1 {
  font-style: var(--title__font-style);
  font-weight: var(--title__font-weight);
  color: var(--title__color);
  text-decoration: var(--title__text-decoration);
  text-transform: var(--title__text-transform);
}
@media (min-width: 641px) {
  .layout-body .content-area h1 {
    font-size: var(--title__font-size);
  }
}
.layout-body .content-area h1:not(.content-item-title) {
  text-align: var(--title__text-alignment);
}
.content-area h2 {
  font-style: var(--heading__font-style);
  font-weight: var(--heading__font-weight);
  color: var(--heading__color);
  text-align: var(--heading__text-alignment);
  text-decoration: var(--heading__text-decoration);
  text-transform: var(--heading__text-transform);
}
@media (min-width: 641px) {
  .content-area h2 {
    font-size: var(--heading__font-size);
  }
}
.content-area h3 {
  font-style: var(--subheading__font-style);
  font-weight: var(--subheading__font-weight);
  text-align: var(--subheading__text-alignment);
  text-decoration: var(--subheading__text-decoration);
  text-transform: var(--subheading__text-transform);
}
@media (min-width: 641px) {
  .content-area h3 {
    font-size: var(--subheading__font-size);
  }
}
.content-area h3,
.content-area h4,
.content-area h5,
.content-area h6 {
  color: var(--subheading__color);
}
.content-area p {
  font-size: var(--content-area-text__font-size);
}
.content-area p > code::before {
  background-color: var(--main__color-secondary);
}
.content-area a {
  font-style: var(--content-area-link__font-style);
  font-weight: var(--content-area-link__font-weight);
  color: var(--content-area-link__color);
  text-decoration: var(--content-area-link__text-decoration);
  text-transform: var(--content-area-link__text-transform);
}
.content-area a:not(.custom-btn):hover {
  font-style: var(--content-area-link-hover__font-style);
  font-weight: var(--content-area-link-hover__font-weight);
  color: var(--content-area-link-hover__color);
  text-decoration: var(--content-area-link-hover__text-decoration);
  text-transform: var(--content-area-link-hover__text-transform);
}
.content-area pre::before {
  background-color: var(--main__color-secondary);
}
.content-area > code::before {
  background-color: var(--main__color-secondary);
}
.content-area .custom-btn {
  padding: calc(var(--content-area-button__padding) - 6px) var(--content-area-button__padding);
  font-size: var(--content-area-button__font-size);
  font-style: var(--content-area-button__font-style);
  font-weight: var(--content-area-button__font-weight);
  color: var(--content-area-button__color);
  text-decoration: var(--content-area-button__text-decoration);
  text-transform: var(--content-area-button__text-transform);
  background-color: var(--content-area-button__background-color);
  opacity: var(--content-area-button__opacity);
}
.content-area .custom-btn:hover {
  font-style: var(--content-area-button-hover__font-style);
  font-weight: var(--content-area-button-hover__font-weight);
  color: var(--content-area-button-hover__color);
  text-decoration: var(--content-area-button-hover__text-decoration);
  text-transform: var(--content-area-button-hover__text-transform);
  background-color: var(--content-area-button-hover__background-color);
  opacity: var(--content-area-button-hover__opacity);
}
[data-view-state="editmode"] .content-area .custom-btn.edy-buy-button {
  padding: calc(var(--content-area-button__padding) - 7px) calc(var(--content-area-button__padding) - 1.22px);
}
.content-area table td,
.content-area table th {
  padding: var(--content-area-table__padding);
  font-size: var(--content-area-table__font-size);
}
.content-area table td::before,
.content-area table th::before {
  border-color: var(--content-area-table__border-color);
  border-style: var(--content-area-table__border-style);
  opacity: var(--content-area-table__border-opacity);
}

.edy-fe-label,
.form_field_label {
  font-size: var(--content-area-form-field-label__font-size);
  font-style: var(--content-area-form-field-label__font-style);
  font-weight: var(--content-area-form-field-label__font-weight);
  color: var(--content-area-form-field-label__color);
  text-decoration: var(--content-area-form-field-label__text-decoration);
  text-transform: var(--content-area-form-field-label__text-transform);
}

.form_field_textfield,
.form_field_textarea,
.form_field_select,
.form_field label {
  font-style: var(--content-area-form-field-text__font-style);
  font-weight: var(--content-area-form-field-text__font-weight);
  color: var(--content-area-form-field-text__color);
  text-decoration: var(--content-area-form-field-text__text-decoration);
  text-transform: var(--content-area-form-field-text__text-transform);
}
.form_field_textfield:not([data-group="comment-field"]),
.form_field_textarea:not([data-group="comment-field"]),
.form_field_select:not([data-group="comment-field"]),
.form_field label:not([data-group="comment-field"]) {
  font-size: var(--content-area-form-field-text__font-size);
}

.form_field_textfield,
.form_field_textarea,
.form_field_select {
  background-color: var(--content-area-form-field-text__background-color);
  border-color: var(--content-area-form-field-text__border-color);
}

.form_field_checkbox + .form_control_indicator::before {
  background-color: var(--content-area-form-field-text__background-color);
  border-color: var(--content-area-form-field-text__border-color);
}

.form_field_radio + .form_control_indicator::before {
  background-color: var(--content-area-form-field-text__background-color);
  border-color: var(--content-area-form-field-text__background-color);
  outline-color: var(--content-area-form-field-text__border-color);
}
.form_field_radio:checked + .form_control_indicator::before {
  background-color: var(--content-area-form-field-text__color);
}

.form_submit input {
  padding: calc(var(--content-area-button__padding) - 6px) var(--content-area-button__padding);
  font-size: var(--content-area-button__font-size);
  font-style: var(--content-area-button__font-style);
  font-weight: var(--content-area-button__font-weight);
  color: var(--content-area-button__color);
  text-decoration: var(--content-area-button__text-decoration);
  text-transform: var(--content-area-button__text-transform);
  background-color: var(--content-area-button__background-color);
  opacity: var(--content-area-button__opacity);
}
.form_submit input:hover {
  font-style: var(--content-area-button-hover__font-style);
  font-weight: var(--content-area-button-hover__font-weight);
  color: var(--content-area-button-hover__color);
  text-decoration: var(--content-area-button-hover__text-decoration);
  text-transform: var(--content-area-button-hover__text-transform);
  background-color: var(--content-area-button-hover__background-color);
  opacity: var(--content-area-button-hover__opacity);
}

.content-area .edy-content-social-button {
  color: var(--content-area-link__color);
}

.content-item-boxes {
  max-width: var(--main__width);
}

.item-list-page .content-item-box {
  color: var(--content-item-box__color);
}
@media (min-width: 641px) {
  .item-list-page .content-item-box {
    width: var(--content-item-box__width);
  }
}

.item-top .top-inner {
  border-radius: var(--content-item-box__image-radius);
}

.item-list-page .item-title {
  font-style: var(--content-item-box__font-style);
  font-weight: var(--content-item-box__font-weight);
  text-align: var(--content-item-box__alignment);
  text-decoration: var(--content-item-box__text-decoration);
  text-transform: var(--content-item-box__text-transform);
}
@media (min-width: 641px) {
  .item-list-page .item-title {
    font-size: var(--content-item-box__font-size);
  }
}

.article__title {
  font-size: var(--content-area-article-title__font-size);
  font-style: var(--content-area-article-title__font-style);
  font-weight: var(--content-area-article-title__font-weight);
  color: var(--content-area-article-title__color);
  text-decoration: var(--content-area-article-title__text-decoration);
  text-transform: var(--content-area-article-title__text-transform);
}
.article__date {
  font-size: var(--content-area-article-date__font-size);
  font-style: var(--content-area-article-date__font-style);
  font-weight: var(--content-area-article-date__font-weight);
  color: var(--content-area-article-date__color);
  text-decoration: var(--content-area-article-date__text-decoration);
  text-transform: var(--content-area-article-date__text-transform);
  opacity: var(--content-area-article-date__opacity);
}

.article-nav {
  color: var(--content-area-text__color);
}

.comments {
  max-width: calc(var(--layout-body-narrow__max-width) - 260px);
}
.comments__title {
  color: var(--main__color-primary);
}
