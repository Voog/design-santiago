module.exports = function(grunt) {
  'use strict';

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // Removes old files.
    clean: {
      reset: {
        src: ['assets', 'images', 'javascripts', 'stylesheets']
      },

      remove: {
        src: ['sources/components/custom-styles/tmp']
      }
    },

    // Concatenates the javascript source files to the javascripts folder.
    concat: {
      build: {
        src: [
          'node_modules/jquery-lazyload/jquery.lazyload.js',
          'node_modules/textarea-autosize/dist/jquery.textarea_autosize.js',
          'node_modules/headroom.js/dist/headroom.js',
          'sources/javascripts/concat/*.js'
        ],
        dest: 'javascripts/main.js'
      }
    },

    // Minifies the javascript files.
    uglify: {
      build: {
        files: [{
          expand: true,
          cwd: 'javascripts/',
          src: [
            '*.js',
            '!*.min.js'
          ],
          dest: 'javascripts/',
          ext: '.min.js'
        }]
      }
    },

    // Compiles the stylesheet files.
    sass: {
      build_main: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'sources/stylesheets',
          src: 'main.scss',
          dest: 'stylesheets/',
          ext: '.css'
        }]
      },

      // Builds custom style components to temporary folder.
      build_custom_styles: {
        options: {
          style: 'expanded',
          sourcemap: 'none'
        },
        files: [{
          expand: true,
          cwd: 'sources/components/custom-styles',
          src: '*.scss',
          dest: 'sources/components/custom-styles/tmp',
          ext: '.css'
        }]
      }
    },

    postcss: {
      options: {
        processors: [
          require('autoprefixer')({
            browsers: 'last 4 versions'
          })
        ]
      },
      main_styles: {
        src: [
          'stylesheets/*.css',
          'stylesheets/!*.min.css'
        ]
      },
      custom_styles: {
        src: [
          'sources/components/custom-styles/tmp/*.css'
        ]
      }
    },

    // Minifies the stylesheet files.
    cssmin: {
      build: {
        expand: true,
        cwd: 'stylesheets/',
        src: [
          '*.css',
          '!*.min.css'
        ],
        dest: 'stylesheets/',
        ext: '.min.css'
      }
    },

    // Minifies the image files.
    imagemin: {
      build_images: {
        files: [{
          expand: true,
          cwd: 'sources/images/minify',
          src: '*.{png,jpg,gif}',
          dest: 'images/'
        }]
      },

      build_assets: {
        files: [{
          expand: true,
          cwd: 'sources/assets/minify',
          src: '*.svg',
          dest: 'assets/'
        }]
      }
    },

    replace: {
      custom_styles: {
        src: ['sources/components/custom-styles/tmp/*.css'],
        overwrite: true,
        replacements: [
          {
            from: '/*_LIQUID ',
            to: ''
          },
          {
            from: ' LIQUID_*/',
            to: ''
          }
        ]
      }
    },

    // Copys the files from the source folders to the layout folders.
    copy: {
      assets: {
        files: [
          {
            expand: true,
            cwd: 'sources/assets/copy',
            src: '*',
            dest: 'assets/'
          }
        ]
      },

      images: {
        files: [
          {
            expand: true,
            cwd: 'sources/images/copy',
            src: '*',
            dest: 'images/'
          }
        ]
      },

      javascripts: {
        files: [
          {
            expand: true,
            cwd: 'sources/javascripts/copy',
            src: '*',
            dest: 'javascripts/'
          }
        ]
      },

      // Copies the compiled css files from temporary folder to "components"
      // folder and renames the files to ""*.tpl".
      custom_styles: {
        files: [
          {
            expand: true,
            cwd: 'sources/components/custom-styles/tmp',
            src: '*.css',
            dest: 'components',
            ext: '.tpl'
          }
        ]
      }
    },

    // Watches the project for changes and recompiles the output files.
    watch: {
      js_copy: {
        files: 'sources/javascripts/copy/*.js',
        tasks: ['copy:javascripts']
      },

      js_concat: {
        files: 'sources/javascripts/concat/*.js',
        tasks: ['concat:build', 'uglify:build']
      },

      css_main: {
        files: [
          'sources/stylesheets/*.scss',
          'sources/stylesheets/*/*.scss',
          'sources/stylesheets/*/*/*.scss'
        ],
        tasks: ['sass:build_main', 'postcss', 'cssmin:build']
      },

      custom_styles: {
        files: 'sources/components/custom-styles/*.scss',
        tasks: ['sass:build_custom_styles', 'postcss:custom_styles', 'replace', 'copy:custom_styles', 'clean:remove']
      },

      img_copy: {
        files: 'sources/images/copy/*',
        tasks: [ 'copy:images']
      },

      img_minify: {
        files: 'sources/images/minify/*',
        tasks: ['imagemin:build_images']
      },

      assets_copy: {
        files: 'sources/assets/copy/*',
        tasks: ['copy:assets']
      },

      assets_minify: {
        files: 'sources/assets/minify/*',
        tasks: ['imagemin:build_assets']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-postcss');
  grunt.loadNpmTasks('grunt-text-replace');

  grunt.registerTask('default', ['clean:reset', 'concat', 'uglify', 'sass', 'postcss:main_styles', 'cssmin', 'imagemin', 'postcss:custom_styles', 'replace', 'copy', 'clean:remove']);
};
