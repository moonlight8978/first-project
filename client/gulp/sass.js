'use strict';

let gulp = require('gulp');
let sass = require('gulp-sass');
let autoprefixer = require('gulp-autoprefixer');
let cleanCSS = require('gulp-clean-css');

let config = require('./config');

module.exports = {
    compile: compile
};

function compile() {
    return gulp.src(config.assets_path + 'scss/application.scss')
		.pipe(sass().on('error', sass.logError))
		.pipe(autoprefixer())
		.pipe(cleanCSS())
        .pipe(gulp.dest(config.build + 'css'));
}