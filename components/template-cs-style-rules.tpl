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
  font-style: var(--menu-main__hover-font-style);
  font-weight: var(--menu-main__hover-font-weight);
  color: var(--menu-main__hover-color);
  text-transform: var(--menu-main__hover-text-transform);
}
@media (min-width: 641px) {
  .menu-main__item:not(.menu-main__item--selected) a:hover {
    border-bottom: var(--menu-main__hover-text-decoration);
    opacity: var(--menu-main__hover-opacity);
  }
}
.menu-main__item--selected a {
  font-style: var(--menu-main__active-font-style);
  font-weight: var(--menu-main__active-font-weight);
  color: var(--menu-main__active-color);
  text-transform: var(--menu-main__active-text-transform);
  opacity: var(--menu-main__active-opacity);
}
@media (min-width: 641px) {
  .menu-main__item--selected a {
    border-bottom: var(--menu-main__active-text-decoration);
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
  font-style: var(--menu-sub__hover-font-style);
  font-weight: var(--menu-sub__hover-font-weight);
  color: var(--menu-sub__hover-color);
  text-decoration: var(--menu-sub__hover-text-decoration);
  text-transform: var(--menu-sub__hover-text-transform);
  opacity: var(--menu-sub__hover-opacity);
}
.menu-sub__item--selected a {
  font-style: var(--menu-sub__active-font-style);
  font-weight: var(--menu-sub__active-font-weight);
  color: var(--menu-sub__active-color);
  text-decoration: var(--menu-sub__active-text-decoration);
  text-transform: var(--menu-sub__active-text-transform);
  opacity: var(--menu-sub__active-opacity);
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
  font-style: var(--content-area-link__hover-font-style);
  font-weight: var(--content-area-link__hover-font-weight);
  color: var(--content-area-link__hover-color);
  text-decoration: var(--content-area-link__hover-text-decoration);
  text-transform: var(--content-area-link__hover-text-transform);
}
.content-area pre::before {
  background-color: var(--main__color-secondary);
}
.content-area > code::before {
  background-color: var(--main__color-secondary);
}
.content-area .custom-btn {
  padding: 10px 16px;
  font-family: inherit;
  font-size: 20px;
  line-height: 1.4;
  color: #fff;
  background-color: #ed1c24;
}
.content-area .custom-btn:hover {
  background-color: rgba(237, 28, 36, 0.75);
}
.content-area table td,
.content-area table th {
  padding: 11.5px;
  border-style: solid;
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
