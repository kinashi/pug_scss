gulp        = require 'gulp'
$           = require('gulp-load-plugins')()
buffer      = require 'vinyl-buffer'
path        = require 'path'
config      = require path.join(__dirname, 'config.coffee')

gulp.task 'sass', (cb) ->
  gulp.src path.join(config.sassDir, 'style.scss')
    .pipe($.sass().on('error', $.sass.logError))
    .pipe($.autoprefixer(
      browsers: ['last 2 versions']
      cascade: false
    ))
    # .pipe($.csso())
    .pipe($.rename(
      basename: 'style'
    ))
    .pipe(gulp.dest(config.distDir))


gulp.task 'pug', (cb) ->
  gulp.src path.join(config.pugDir, 'index.pug')
  .pipe($.pug(
    pretty: true
  ))
  .pipe(gulp.dest(config.distDir))


gulp.task 'watch', ['default'], ->
  gulp.watch path.join(config.sassDir, '**/*.scss'), ['pug', 'sass']

gulp.task 'default', ['pug', 'sass']
