let gulp = require('gulp'),
	babel = require('gulp-babel'),
	concat = require('gulp-concat'),
	webpack = require('webpack-stream'),
	uglify = require('gulp-uglify');

let config = require('./config');

let compile = function compile() {
	return gulp.src(config.app + 'app/app.module.js')
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
		.pipe(uglify())
		.pipe(concat('application.js'))
		.pipe(gulp.dest(config.build + 'js'));
}

module.exports = {
	compile: compile
};