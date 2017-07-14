let gulp = require('gulp');
let angularFilesort = require('gulp-angular-filesort');
let naturalSort = require('gulp-natural-sort');
let inject = require('gulp-inject');
let es = require('event-stream');
let babel = require('gulp-babel');

let config = require('./config');

function angular() {
    return gulp.src(config.app + 'index.html')
        .pipe(inject(
            gulp.src([config.app + 'app/**/*.js'])
                .pipe(naturalSort())
                .pipe(babel({ presets: ['es2015', 'es2016', 'es2017'] }))
                .pipe(angularFilesort()),
            { relative: true }
        ))
        .pipe(gulp.dest(config.app));
}

module.exports = {
    angular: angular
}
