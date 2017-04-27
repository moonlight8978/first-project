'use strict';

let gulp = require('gulp'),
    sass = require('gulp-sass'),
	autoprefixer = require('gulp-autoprefixer');

let assets_path = 'public/assets/';

module.exports = {
    compile: compile
};

function compile() {
    return gulp.src(assets_path + 'scss/application.scss')
        .pipe(sass().on('error', sass.logError))
		.pipe(autoprefixer())
        .pipe(gulp.dest(assets_path + 'css'));
}