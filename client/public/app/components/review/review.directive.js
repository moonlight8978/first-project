(function () {
    'use strict';

    angular
        .module('app')
        .directive('review', review);

    review.$inject = [];

    function review() {
        return {
            restrict: 'E',
            scope: {
            },
            templateUrl: 'app/components/review/review.html',
            link: function (scope, elm, attr) {

            }
        };
    }
})();
