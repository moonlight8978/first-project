(function () {
    'use strict';

    angular
        .module('app')
        .directive('delayShow', delayShow);

    delayShow.$inject = ['$timeout', '$window'];

    function delayShow($timeout, $window) {
        return {
            restrict: 'A',
            scope: {
                time: '=',
                animation: '@'
            },
            link: function (scope, element, attrs) {
                angular.element(document).ready(function () {
                    $timeout(() => {
                        $(element).addClass(scope.animation).removeClass('hide');
                        // $(element).removeClass('hide');
                    }, scope.time);
                })
            }
        };
    }
})();
