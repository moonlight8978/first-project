'use strict';

let gulp = require('gulp');
let babel = require('gulp-babel');
let concat = require('gulp-concat');
let webpack = require('webpack-stream');
let uglify = require('gulp-uglify');

let config = require('./config');

let compile = function compile() {
	return gulp.src(config.app + 'app/index.js')
		.pipe(webpack({
			module: {
				loaders: [{
                    test: /.jsx?$/,
                    loader: 'babel-loader',
                    exclude: /(node_modules|bower_components)/,
                    query: {
                        presets: ['es2015']
                    }
                }]
			}
        }))
		// .pipe(uglify())
		.pipe(concat('application.js'))
		.pipe(gulp.dest(config.build + 'js'));
}

module.exports = {
	compile: compile
};