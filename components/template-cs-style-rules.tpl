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
