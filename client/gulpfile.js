'use strict';

let gulp = require('gulp');

let sass = require('./gulp/sass'),
    config = require('./gulp/config');

gulp.task('sass:compile', sass.compile);

gulp.task('frontend:style', () => {
    gulp.watch(config.assets_path + '/scss/*.scss', ['sass:compile']);
});
