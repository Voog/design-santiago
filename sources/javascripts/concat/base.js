;(function($) {
  // ===========================================================================
  // Function to change menu language name font size or hide it.
  // ===========================================================================
  var changeMenuLanguageName = function() {

    var menuLanguageName = document.querySelectorAll('.menu-language-name');
    if (!menuLanguageName) { return; }

    if (menuLanguageName.length > 2) {
      menuLanguageName.forEach(function(el) {
        el.classList.add('language-name-resize');
      })
    } else {
      menuLanguageName.forEach(function(el) {
        el.classList.remove('language-name-resize');
      })
    }
  };
  // ===========================================================================
  // Function to detect if site is displayed in editmode.
  // ===========================================================================
  var editmode = function () {
    return $('html').attr('data-view-state') === 'editmode';
  };

  // ===========================================================================
  // Function to detect if site language menu popover is open.
  // ===========================================================================
  var languageMenuPopoverOpen = function() {
    return $('html').hasClass('menu-language-popover-open');
  };

  // ===========================================================================
  // Helper function to limit the rate at which a function can fire.
  // ===========================================================================
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this,
          args = arguments;

      var later = function() {
        timeout = null;

        if (!immediate) {
          func.apply(context, args);
        }
      };

      var callNow = immediate && !timeout;

      clearTimeout(timeout);
      timeout = setTimeout(later, wait);

      if (callNow) {
        func.apply(context, args);
      }
    };
  };

  // ===========================================================================
  // Bind site buttons functionality.
  // ===========================================================================
  var bindInterfaceButtons = function() {
    // Triggers the events when clicked anywhere on the document. Used for
    // sideclick functionality. Use the data-sideclick="prevent" on elements
    // that shouldn't trigger the sideclick events.
    $(document).on('click touchstart', function(event) {
      // Also supports fallback for disabling sideclick with "js-prevent-sideclick" class (SettingsEditor relies on it).
      if (!$(event.target).closest('[data-sideclick="prevent"]').length && !$(event.target).closest('.js-prevent-sideclick').length) {
        var $html = $('html');

        $html.removeClass('menu-language-popover-open');
        $html.attr('data-menu-main-state', 'closed');
        $html.removeClass('site-search-opened');

        $('.js-search-input').val('');
      }
    });

    // Toggles main menu in mobile view.
  	$('[data-behavior="toggle-menu-main"]').click(function() {
      var $html = $('html');

      if ($html.attr('data-menu-main-state') == 'open') {
        $html.attr('data-menu-main-state', 'closed');
      } else {
        $html.attr('data-menu-main-state', 'open');
        $html.removeClass('menu-language-popover-open site-search-opened');
      }
  	});

    // Toggles blog article comments author fields.
    $('[data-behavior="toggle-comment-form-fields"]')
      .on('focus', function() {
        $('#comment-form__details').attr('data-display-state', 'block');
      })
      .on('blur', function() {
        if ($('#comment-form__body').val().length === 0 && $('#comment-form__name').val().length === 0 && $('#comment-form__email').val().length === 0) {
          setTimeout(function() {
            if (!$(document.activeElement).is('[data-group="comment-field"]')) {
              $('#comment-form__details').attr('data-display-state', 'none');
            }
          }, 0);
        }
      })
    ;

    // Toggles language menu popover.
    $('.js-toggle-menu-language').click(function() {
      var $html = $('html');

      $html.toggleClass('menu-language-popover-open');

      if ($html.hasClass('menu-main-opened') || $html.hasClass('site-search-opened')) {
        $html.removeClass('menu-main-opened site-search-opened');

        setTimeout(function(){
          positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
        }, 300);
      } else if ($html.hasClass('menu-language-popover-open')) {
        positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
      }
    });

    // Toggles site search.
    $('.js-toggle-site-search').click(function() {
      var $html = $('html');

      $html.removeClass('menu-language-popover-open');
      $html.attr('data-menu-main-state', 'closed');
      $html.toggleClass('site-search-opened');

      if ($html.hasClass('site-search-opened')) {
        $('.js-search-input').focus();
      }
    });

    // Clears site search input.
    $('.js-clear-search-input').click(function() {
      var $searchInput = $('.js-search-input');

      if ($searchInput.val().length > 0) {
        $searchInput.val('').focus();
      } else {
        $('html').removeClass('site-search-opened');
      }
    });
  };

  // ===========================================================================
  // Positions popover menus under the toggleing button.
  // ===========================================================================
  var positionPopoverMenu = function(popoverButton, popoverMenu) {
    var $popoverButton = $(popoverButton);

    $(popoverMenu).css({
      top: Math.round($popoverButton.offset().top + $popoverButton.outerHeight()),
      right: Math.round($(window).width() - $popoverButton.offset().left - $popoverButton.outerWidth())
    });
  };

  // ===========================================================================
  // Toggles language menu mode.
  // ===========================================================================
  var bindLanguageMenuSettings = function(languageMenuValuesObj) {
    if (!('type' in languageMenuValuesObj)) {
      languageMenuValuesObj.type = 'popover';
    }

    if (!('item_state' in languageMenuValuesObj)) {
      languageMenuValuesObj.item_state = 'flags_and_names';
    }

    $('.js-menu-language-settings-toggle').each(function(index, languageMenuSettingsButton) {
      var langSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
        menuItems: [
          {
            "titleI18n": "format",
            "type": "radio",
            "key": "type",
            "list": [
              {
                "titleI18n": "dropdown_menu",
                "value": "popover"
              },
              {
                "titleI18n": "expanded_menu",
                "value": "list"
              },
            ]
          },
          {
            "titleI18n": "show",
            "type": "radio",
            "key": "item_state",
            "list": [
              {
                "titleI18n": "flags_only",
                "value": "flags_only"
              },
              {
                "titleI18n": "names_only",
                "value": "names_only"
              },
              {
                "titleI18n": "flags_and_names",
                "value": "flags_and_names"
              }
            ]
          }
        ],

        buttonTitleI18n: "settings",

        values: languageMenuValuesObj,

        containerClass: ['js-menu-language-settings-popover', 'js-prevent-sideclick'],

        preview: function(data) {
          var $html = $('html'),
              $languageSettingsMenuElement = $('.js-menu-language-settings');

          if (data.type === 'list') {
            $html.removeClass('language-menu-mode-popover');
            $html.removeClass('menu-language-popover-open');
            $html.addClass('language-menu-mode-list');

            $languageSettingsMenuElement.appendTo('.js-menu-language-list-setting-parent');
          } else {
            $html.removeClass('language-menu-mode-list');
            $html.addClass('language-menu-mode-popover');
            $html.addClass('menu-language-popover-open');

            $languageSettingsMenuElement.appendTo('.js-menu-language-popover-setting-parent');
          }

          if (data.item_state === 'flags_only') {
            $html.removeClass('language-flags-disabled');
            $html.removeClass('language-names-enabled');
            $html.addClass('language-flags-enabled');
            $html.addClass('language-names-disabled');
          } else if (data.item_state === 'names_only') {
            $html.removeClass('language-flags-enabled');
            $html.removeClass('language-names-disabled');
            $html.addClass('language-flags-disabled');
            $html.addClass('language-names-enabled');
          } else if (data.item_state === 'flags_and_names') {
            $html.removeClass('language-flags-disabled');
            $html.removeClass('language-names-disabled');
            $html.addClass('language-flags-enabled');
            $html.addClass('language-names-enabled');
          }

          positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
          this.setPosition();
        },

        commit: function(data) {
          siteData.set('settings_language_menu', data);
        }
      });
    });
  };

  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function(searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // Results are lazy-loaded on scroll.
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        // instead of modal (with scroll lazy load support).
        resultsContainer: $('.js-voog-search-modal').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint (adds class "voog-search-mobile-mode" if <= nr).
        mobileModeWidth: 640,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    }
  };

  var bindCustomTexteditorStyles = function(buttonTranslation) {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: buttonTranslation, tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  };

  // ===========================================================================
  // Wraps content area tables with the parent <div>. (Enables horizontal
  // scrolling if table's width is wider than the content area itself).
  // ===========================================================================
  var wrapContentAreaTables = function() {
    $.each($('.content-area'), function() {
      $(this).find('table').wrap('<div class="table-container"></div>');
    });
  };

  // ===========================================================================
  // Resizes form textarea if user adds/removes a line in textarea.
  // ===========================================================================
  var autoResizeFormTextArea = function() {
    $('[data-init="auto-resize"]').textareaAutoSize();
  };

  // ===========================================================================
  // Scrolls to the form if submit failed or succeeded (to show the error
  // messages or success notice to the user).
  // ===========================================================================
  var focusFormMessages = function() {
    $(document).ready(function() {
      if ($('.comment-form').hasClass('form_with_errors')) {
        $('html, body')
          .scrollTop($('.comment-form')
          .offset().top)
        ;
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body')
          .scrollTop($('.form_error, .form_notice').closest('form')
          .offset().top)
        ;
      }
    });
  };

  // ===========================================================================
  // Removes error highlighting from form input if user modifies the faulty
  // field.
  // ===========================================================================
  var removeFormInputErrorHighlight = function() {
    $('[class^=form_field_]').on('input change', function() {
      $(this).closest('.form_field_with_errors').removeClass('form_field_with_errors');
    });
  };

  var setImageOrientation = function($contentItemBox, width, height) {
    var $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
        $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');

    if (width > height) {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-landscape')
      ;
    } else if (width === height) {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-square')
      ;
    } else {
      $imgDropAreaTarget
        .removeClass('image-landscape image-square image-portrait')
        .addClass('image-portrait')
      ;
    }

    if ($imgDropAreaTarget.hasClass('image-square')) {
      $cropToggleButton
        .removeClass('is-visible')
        .addClass('is-hidden')
      ;
    } else {
      $cropToggleButton
        .removeClass('is-hidden')
        .addClass('is-visible')
      ;
    }
  };

  var setItemImage = function($contentItemBox, $imgDropArea, itemId, imageId, itemType) {
    var apiType = itemType === 'article' ? 'articles' : 'pages',
        itemData = new Edicy.CustomData({
          type: itemType,
          id: itemId
        });

    $.ajax({
       type: 'PATCH',
       contentType: 'application/json',
       url: '/admin/api/' + apiType +'/' + itemId,
       data: JSON.stringify({'image_id': imageId}),
       dataType: 'json',
       success: function(data) {
         itemData.set('image_crop_state', 'not-cropped');
         $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
         $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', .5);
         $imgDropArea.css('opacity', 1);
       },
       timeout: 30000,
       error: function(data) {
         $contentItemBox.removeClass('not-loaded is-loaded with-error').addClass('with-error');
       }
    });
  };

  // ===========================================================================
  // Binds editmode image drop areas.
  // ===========================================================================
  var bindContentItemImgDropAreas = function(placeholderText) {
    $('.js-content-item-img-drop-area').each(function(index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
          $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 1280,
        placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',
        removeBtn: '<div class="edy-img-drop-area-remove-image">' +
                      '<div class="edy-img-drop-area-remove-image-ico">' +
                        '<svg width="16" height="20" viewBox="0 0 26 30" xmlns="http://www.w3.org/2000/svg">' +
                          '<g fill-rule="nonzero" fill="currentColor">' +
                            '<g transform="translate(2 5)">' +
                              '<path d="M0 .997h2V21c0 1 1 2 2 2h14c1 0 2-1 2-2V1h2v20c0 2.25-1.75 4-4 4H4c-2.25 0-4-1.75-4-4V.997z"/>' +
                              '<rect x="10" y="4" width="2" height="16" rx="1"/>' +
                              '<rect x="5" y="4" width="2" height="16" rx="1"/>' +
                              '<rect x="15" y="4" width="2" height="16" rx="1"/>' +
                            '</g>' +
                            '<path d="M26 4v2H0V4h7V2c0-1 1-2 2-2h8c1 0 2 1 2 2v2h7zM9 4h8V3c0-.5-.5-1-1-1h-6c-.5 0-1 .5-1 1v1z"/>' +
                          '</g>' +
                        '</svg>' +
                      '</div>' +
                    '</div>',

        change: function(data) {
          var imageId;

          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
            .css('opacity', .1)
          ;

          if (data) {
            imageId = data.original_id;

            $contentItemBox
              .removeClass('without-image is-loaded with-error')
              .addClass('with-image not-loaded')
            ;

            setImageOrientation($contentItemBox, data.width, data.height);
          } else {
            imageId = null;

            $contentItemBox
              .removeClass('with-image is-loaded with-error')
              .addClass('without-image not-loaded')
            ;

            $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 0);
          }

          setItemImage($contentItemBox, $imgDropAreaTarget, itemId, imageId, itemType);
        }
      });
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindContentItemImageCropToggle = function() {
    $('.js-toggle-crop-state').on('click', function() {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
          $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          }),
          imageCropState;

      if ($imgDropAreaTarget.hasClass('is-cropped')) {
        $imgDropAreaTarget
          .removeClass('is-cropped')
          .addClass('not-cropped')
        ;

        imageCropState = 'not-cropped';
      } else {
        $imgDropAreaTarget
          .removeClass('not-cropped')
          .addClass('is-cropped')
        ;

        imageCropState = 'is-cropped';
      }

      itemData.set('image_crop_state', imageCropState);
    });
  };

  // ===========================================================================
  // Load article cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var bindContentItemImageLazyload = function() {
    $(document).ready(function() {
      setTimeout(function() {
        $('.js-content-item-box').addClass('not-loaded');
      }, 3000);
    });

    $('.js-lazyload').lazyload({
      threshold : 500,
      effect : "fadeIn",
      placeholder: 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',

      load: function() {
        var $contentItemBox = $(this).closest('.js-content-item-box');

        $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');

        setTimeout(function() {
          $contentItemBox.removeClass('not-loaded with-error');
          $contentItemBox.find('.js-loader').remove();
        }, 3000);
      }
    });
  };

  // ===========================================================================
  // Toggles product categories visibility in main menu.
  // ===========================================================================
  var bindRootItemSettings = function(rootItemValuesObj) {
    if (!('show_product_related_pages_in_main_menu' in rootItemValuesObj)) {
      rootItemValuesObj.show_product_related_pages_in_main_menu = false;
    }

    $('.js-root-item-settings-toggle').each(function(index, languageMenuSettingsButton) {
      var rootItemSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
        menuItems: [
          {
            "titleI18n": "show_in_main_menu",
            "type": "checkbox",
            "key": "show_product_related_pages_in_main_menu",
            "states": {
              "on": true,
              "off": false
            }
          }
        ],

        buttonTitleI18n: "settings",

        values: rootItemValuesObj,

        containerClass: ['js-root-item-settings-popover', 'js-prevent-sideclick'],

        preview: function(data) {
          if (!data.show_product_related_pages_in_main_menu === true) {
            $('.js-menu-item-products').addClass('menu-main__item--hidden');
          } else {
            $('.js-menu-item-products').removeClass('menu-main__item--hidden');
          }
        },

        commit: function(data) {
          siteData.set('settings_root_item', data);
        }
      });
    });
  };

  // ===========================================================================
  // Builds an inline svg icon for custom shopping cart button.
  // ===========================================================================
  var buildCustomShoppingCartIcon = function() {
    var icoElement = document.createElement('div');

    icoElement.classList.add('edy-ecommerce-custom-ico')
    icoElement.innerHTML = '<svg width="34" height="28" viewBox="0 0 34 28" xmlns="http://www.w3.org/2000/svg"><g fill-rule="evenodd"><path d="M3.224 12.139a.581.581 0 0 0-.469.224.487.487 0 0 0-.085.425l3.442 12.521c.064.232.293.395.555.395h21.188c.262 0 .49-.162.552-.394l3.445-12.522a.484.484 0 0 0-.086-.425.577.577 0 0 0-.468-.224H3.224zm24.631 15.652H6.667c-1.199 0-2.254-.794-2.566-1.93L.658 13.341a2.553 2.553 0 0 1 .437-2.242 2.657 2.657 0 0 1 2.129-1.047h28.074c.846 0 1.621.381 2.127 1.046.494.646.653 1.464.439 2.243L30.42 25.862c-.31 1.135-1.365 1.929-2.565 1.929z"/><path d="M6.826 12.139a1.044 1.044 0 0 1-.824-1.684l7.304-9.391a1.042 1.042 0 1 1 1.648 1.28l-7.305 9.391a1.039 1.039 0 0 1-.823.404m20.871 0c-.311 0-.619-.139-.824-.403l-7.305-9.391a1.042 1.042 0 1 1 1.647-1.28l7.304 9.391a1.042 1.042 0 0 1-.822 1.683"/></g></svg>';

    $('.edy-ecommerce-shopping-cart-button').prepend(icoElement);
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var initWindowResize = function() {
    $(window).resize(debounce(function() {
      if (languageMenuPopoverOpen()) {
        positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
      }
    }, 25));
  };

  // ===========================================================================
  // Sets functions that will be initiated on blog listing layouts.
  // ===========================================================================
  // var initBlogPage = function() {
  // };

  // ===========================================================================
  // Sets functions that will be initiated on items layouts.
  // ===========================================================================
  var initItemsPage = function() {
    if (!editmode()) {
      bindContentItemImageLazyload();
    }
  };

  // ===========================================================================
  // Sets functions that will be initiated globally.
  // ===========================================================================
  var init = function() {
    bindInterfaceButtons();
    autoResizeFormTextArea();
    focusFormMessages();
    removeFormInputErrorHighlight();
    changeMenuLanguageName();

    if (!editmode()) {
      wrapContentAreaTables();
    }

    $(document).on('voog:shoppingcart:button:created', function() {
      buildCustomShoppingCartIcon();

      (new Headroom($('.edy-ecommerce-shopping-cart-button').get(0), {
        offset : 100,
        tolerance : 0
      })).init();

      if ($(window).width() < 641 && $('body').scrollTop() < 49) {
        $('body').scrollTop(0);
      }
    });

    (new Headroom($('.layout-header__options').get(0), {
      offset : 100,
      tolerance : 0
    })).init();
  };

  // Enables the usage of the initiations outside this file.
  window.template = $.extend(window.template || {}, {
    // Initiations for layouts.
    // initBlogPage: initBlogPage,
    // initArticlePage: initArticlePage,
    // initCommonPage: initCommonPage,
    // initFrontPage: initFrontPage,
    initItemsPage: initItemsPage,
    bindLanguageMenuSettings: bindLanguageMenuSettings,
    bindSiteSearch: bindSiteSearch,
    bindCustomTexteditorStyles: bindCustomTexteditorStyles,
    bindContentItemImgDropAreas: bindContentItemImgDropAreas,
    bindContentItemImageCropToggle: bindContentItemImageCropToggle,
    bindRootItemSettings: bindRootItemSettings

    // Initiations for specific functions.
  });

  // ===========================================================================
  // Initiates global functions.
  // ===========================================================================
  initWindowResize();
  init();
})(jQuery);
