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
