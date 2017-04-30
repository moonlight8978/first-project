'use strict';

let gulp = require('gulp');

let sass = require('./gulp/sass');
let config = require('./gulp/config');
let webpack = require('./gulp/webpack');

gulp.task('sass:build', sass.compile);

gulp.task('es6:build', webpack.compile);

gulp.task('css:watch', () => {
    gulp.watch(config.assets_path + 'scss/*.scss', ['sass:build']);
});

gulp.task('js:watch', () => {
	gulp.watch(config.js_path + '**/*.js', ['es6:build']);
});