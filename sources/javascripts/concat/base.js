;(function($) {
  // ===========================================================================
  // Function to detect if site is displayed in editmode.
  // ===========================================================================
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  // ===========================================================================
  // Function to detect if current page is article.
  // ===========================================================================
  var blogArticlePage = function() {
    return $('body').hasClass('blog-article-page');
  };

  // ===========================================================================
  // Bind site buttons functionality.
  // ===========================================================================
  var bindInterfaceButtons = function() {
    // Triggers the events when clicked anywhere on the document. Used for
    // sideclick functionality. Use the data-sideclick="prevent" on elements
    // that shouldn't trigger the sideclick events.
    $(document).on('click touchstart', function(event) {
      // TODO: Prevent sidemenu closing.
      if (!$(event.target).closest('[data-sideclick="prevent"]').length) {
        $('html').attr('data-state--menu-main', 'closed');
        $('[data-behavior="toggle-menu-main"]').removeClass('is-active');
      }
    });

    // Toggles main menu in mobile view.
  	$('[data-behavior="toggle-menu-main"]').click(function() {
      $(this).toggleClass('is-active');

      var $html = $('html');

      if ($html.attr('data-state--menu-main') == 'open') {
        $html.attr('data-state--menu-main', 'closed');
      } else {
        $html.attr('data-state--menu-main', 'open');
      }
  	});

    // Toggles blog article comments author fields.
    $('[data-behavior="toggle-comment-form-fields"]')
      .on('focus', function() {
        $('[data-js-selector="comment-form-details"]').attr('data-state--display', 'block');
      })
      .on('blur', function() {
        if ($('[data-js-selector="comment-body"]').val().length === 0 && $('[data-js-selector="comment-form-name"]').val().length === 0 && $('[data-js-selector="comment-form-email"]').val().length === 0) {
          setTimeout(function() {
            if (!$(document.activeElement).is('[data-js-class="comment-field"]')) {
              $('[data-js-selector="comment-form-details"]').attr('data-state--display', 'none');
            }
          }, 0);
        }
      })
    ;
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
    var $imgDropAreaTarget = $contentItemBox.find('.js-img-drop-area'),
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

  var setItemImage = function(itemId, imageId, itemType) {
    var apiType;

    // console.log(itemType);

    if (itemType === 'article') {
      apiType = 'articles';
    } else {
      apiType = 'pages';
    }

    $.ajax({
       type: 'PATCH',
       contentType: 'application/json',
       url: '/admin/api/' + apiType +'/' + itemId,
       data: JSON.stringify({'image_id': imageId}),
       dataType: 'json'
    });
  };

  // ===========================================================================
  // Binds editmode backgroun picker areas.
  // ===========================================================================
  var bindContentItemBgPickers = function() {
    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var $bgPickerArea = $(bgPickerArea),
          $bgPickerButton = $bgPickerArea.find('.js-bg-picker-btn'),
          $contentItemBox = $bgPickerArea.closest('.js-content-item-box'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          dataBgKey = $bgPickerButton.data('bg-key');

      var bgPicker = new Edicy.BgPicker($bgPickerButton, {
        picture: $bgPickerButton.data('bg-picture-boolean'),
        target_width: $bgPickerButton.data('bg-target-width'),
        color: $bgPickerButton.data('bg-color-boolean'),

        preview: function(data) {
          var $contentItemBox = $bgPickerArea.closest('.js-content-item-box'),
              $imgDropArea = $bgPickerArea.find('.js-img-drop-area');

          setImageOrientation($contentItemBox, data.width, data.height);

          $bgPickerArea.eq(0).data('imgDropArea').setData({
            id: data.original_id,
            url: data.image,
            width: data.width,
            height: data.height
          });

          $imgDropArea
            .removeClass('is-cropped')
            .addClass('not-cropped')
          ;
        },

        commit: function(data) {
          setItemImage(itemId, data.original_id, itemType);
        }
      });

      $bgPickerArea.data('bgpicker', bgPicker);
    });
  };

  // ===========================================================================
  // Binds editmode image drop areas.
  // ===========================================================================
  var bindContentItemImgDropAreas = function(placeholderText) {
    $('.js-img-drop-area').each(function(index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
          $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
          $bgPickerArea = $contentItemBox.find('.js-bg-picker-area'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          articleData = new Edicy.CustomData({
            type: 'article',
            id: itemId
          }),
          pageData = new Edicy.CustomData({
            type: 'page',
            id: $contentItemBox.data('item-id')
          });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 1280,
        removeBtn: '',
        placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',

        change: function(data) {
          var $bgPickerButton = $contentItemBox.find('.js-bg-picker-btn');

          $contentItemBox
            .addClass('with-image')
            .removeClass('without-image')
          ;

          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
          ;

          setImageOrientation($contentItemBox, data.width, data.height);


          $bgPickerArea.eq(0).data('bgpicker').setData({
            id: data.original_id,
            image: data.url,
            width: data.width,
            height: data.height
          });

          setItemImage(itemId, data.original_id, itemType);

          if (itemType === 'article') {
            articleData.set('image_crop_state', 'not-cropped');
          } else {
            pageData.set('image_crop_state', 'not-cropped');
          }
        }
      });

      $bgPickerArea.data('imgDropArea', imgDropArea);
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindContentItemImageCropToggle = function() {
    $('.js-toggle-crop-state').on('click', function() {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
          $imgDropAreaTarget = $contentItemBox.find('.js-img-drop-area'),
          itemType = $contentItemBox.data('item-type'),
          imageCropState;

      var articleData = new Edicy.CustomData({
        type: 'article',
        id: $contentItemBox.data('item-id')
      });

      var pageData = new Edicy.CustomData({
        type: 'page',
        id: $contentItemBox.data('item-id')
      });

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

      if (itemType === 'article') {
        articleData.set('image_crop_state', imageCropState);
      } else {
        pageData.set('image_crop_state', imageCropState);
      }
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

      load : function() {
        var $contentItemBox = $(this).closest('.js-content-item-box');

        $contentItemBox.removeClass('not-loaded').addClass('is-loaded');

        setTimeout(function() {
          $contentItemBox.removeClass('not-loaded');
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
            console.log(11);
            $('.js-menu-item-products').addClass('is-hidden');
          } else {
            console.log(22);
            $('.js-menu-item-products').removeClass('is-hidden');
          }
        },

        commit: function(data) {
          siteData.set('settings_root_item', data);
        }
      });
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  // var initWindowResize = function() {
  // };

  // ===========================================================================
  // Sets functions that will be initiated on blog listing layouts.
  // ===========================================================================
  // var initBlogPage = function() {
  // };

  // ===========================================================================
  // Sets functions that will be initiated on items layouts.
  // ===========================================================================
  var initItemsPage = function() {
    bindContentItemImageLazyload();
  };

  // ===========================================================================
  // Sets functions that will be initiated globally.
  // ===========================================================================
  var init = function() {
    bindInterfaceButtons();
    focusFormMessages();
    removeFormInputErrorHighlight();

     if (!editmode()) {
       wrapContentAreaTables();
     }
  };

  // Enables the usage of the initiations outside this file.
  window.template = $.extend(window.template || {}, {
    // Initiations for layouts.
    // initBlogPage: initBlogPage,
    // initArticlePage: initArticlePage,
    // initCommonPage: initCommonPage,
    // initFrontPage: initFrontPage,
    initItemsPage: initItemsPage,
    bindContentItemBgPickers: bindContentItemBgPickers,
    bindContentItemImgDropAreas: bindContentItemImgDropAreas,
    bindContentItemImageCropToggle: bindContentItemImageCropToggle,
    bindContentItemImageLazyload: bindContentItemImageLazyload,
    bindRootItemSettings: bindRootItemSettings

    // Initiations for specific functions.
  });

  // ===========================================================================
  // Initiates global functions.
  // ===========================================================================
  // initWindowResize();
  init();
})(jQuery);
