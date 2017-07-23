'use strict';

let gulp = require('gulp');

let sass = require('./gulp/sass');
let config = require('./gulp/config');
let webpack = require('./gulp/webpack');
let inject = require('./gulp/inject');

gulp.task('css:build', sass.compile);

gulp.task('js:build', webpack.compile);

gulp.task('css:watch', () => {
    gulp.watch(config.assets_path + 'scss/**/*.scss', ['css:build']);
});

gulp.task('js:watch', () => {
	gulp.watch(config.js_path + '**/*.js', ['es6:build']);
});

gulp.task('inject:ng', inject.angular);
