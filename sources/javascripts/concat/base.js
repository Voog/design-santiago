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

  var setImageOrientation = function($article, width, height) {
    var $imgDropAreaTarget = $article.find('.js-img-drop-area'),
        $cropToggleButton = $article.find('.js-toggle-crop-state');

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

  var setArticleImage = function(articleId, imageId) {
    $.ajax({
       type: 'PATCH',
       contentType: 'application/json',
       url: '/admin/api/articles/' + articleId,
       data: JSON.stringify({'image_id': imageId}),
       dataType: 'json'
    });
  };

  // ===========================================================================
  // Binds editmode backgroun picker areas.
  // ===========================================================================
  var bindBgPickers = function() {
    $('.js-bg-picker-area').each(function(index, bgPickerArea) {
      var $bgPickerArea = $(bgPickerArea),
          $bgPickerButton = $bgPickerArea.find('.js-bg-picker-btn'),
          articleId = $bgPickerArea.closest('.js-blog-article-newer').data('article-id'),
          dataBgKey = $bgPickerButton.data('bg-key');

      var bgPicker = new Edicy.BgPicker($bgPickerButton, {
        picture: $bgPickerButton.data('bg-picture-boolean'),
        target_width: $bgPickerButton.data('bg-target-width'),
        color: $bgPickerButton.data('bg-color-boolean'),

        preview: function(data) {
          var $article = $bgPickerArea.closest('.js-blog-article-newer'),
              $imgDropArea = $bgPickerArea.find('.js-img-drop-area');

          setImageOrientation($article, data.width, data.height);

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
          setArticleImage(articleId, data.original_id);
        }
      });

      $bgPickerArea.data('bgpicker', bgPicker);
    });
  };

  // ===========================================================================
  // Binds editmode image drop areas.
  // ===========================================================================
  var bindImgDropAreas = function() {
    $('.js-img-drop-area').each(function(index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
          $article = $imgDropAreaTarget.closest('.js-blog-article-newer'),
          $bgPickerArea = $article.find('.js-bg-picker-area'),
          articleId = $article.data('article-id'),
          articleData = new Edicy.CustomData({
            type: 'article',
            id: articleId
          });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 1280,
        removeBtn: '',

        change: function(data) {
          var $bgPickerButton = $article.find('.js-bg-picker-btn');

          $article
            .addClass('with-image')
            .removeClass('without-image')
          ;

          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
          ;

          setImageOrientation($article, data.width, data.height);


          $bgPickerArea.eq(0).data('bgpicker').setData({
            id: data.original_id,
            image: data.url,
            width: data.width,
            height: data.height
          });

          setArticleImage(articleId, data.original_id);
          articleData.set('image_crop_state', 'not-cropped');
        }
      });

      $bgPickerArea.data('imgDropArea', imgDropArea);
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindArticleImageCropToggle = function() {
    $('.js-toggle-crop-state').on('click', function() {
      var $article = $(this).closest('.js-blog-article-newer'),
          $imgDropAreaTarget = $article.find('.js-img-drop-area'),
          imageCropState;

      var articleData = new Edicy.CustomData({
        type: 'article',
        id: $article.data('article-id')
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

      articleData.set('image_crop_state', imageCropState);
    });
  };

  // ===========================================================================
  // Load article cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var bindArticleImageLazyload = function() {
    $(document).ready(function() {
      setTimeout(function() {
        $('.js-blog-article-newer').addClass('not-loaded');
      }, 3000);
    });

    $('.js-lazyload').lazyload({
      threshold : 500,
      effect : "fadeIn",
      placeholder: 'data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==',

      load : function() {
        var $article = $(this).closest('.js-blog-article-newer');

        $article.removeClass('not-loaded').addClass('is-loaded');

        setTimeout(function() {
          $article.removeClass('not-loaded');
          $article.find('.js-loader').remove();
        }, 3000);
      }
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
  var initBlogPage = function() {
    bindArticleImageLazyload();
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
    initBlogPage: initBlogPage,
    // initArticlePage: initArticlePage,
    // initCommonPage: initCommonPage,
    // initFrontPage: initFrontPage,

    // Initiations for specific functions.
    bindBgPickers: bindBgPickers,
    bindImgDropAreas: bindImgDropAreas,
    bindArticleImageCropToggle: bindArticleImageCropToggle
  });

  // ===========================================================================
  // Initiates global functions.
  // ===========================================================================
  // initWindowResize();
  init();
})(jQuery);
