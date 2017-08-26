(function () {
    'use strict';

    angular
        .module('app')
        .directive('writeReview', writeReview);

    function writeReview() {
        return {
            restrict: 'A',
            scope: {
            },
            templateUrl: 'app/components/write-review/write-review.html',
            link: function (scope, elm, attr) {

            }
        };
    }
})();
