'use strict';

let gulp = require('gulp');
let sass = require('gulp-sass');
let autoprefixer = require('gulp-autoprefixer');
let cleanCSS = require('gulp-clean-css');
let concat = require('gulp-concat');

let config = require('./config');

function compile() {
    return gulp.src(config.assets_path + 'scss/application.scss')
		.pipe(sass().on('error', sass.logError))
		.pipe(autoprefixer())
		// .pipe(cleanCSS())
		// .pipe(concat('application.css'))
        .pipe(gulp.dest(config.build + 'css'));
}

module.exports = {
    compile: compile
};