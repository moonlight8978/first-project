(function () {
    'use strict';

    angular
        .module('app')
        .directive('imagePreload', imagePreload);

    function imagePreload() {
        return {
            restrict: 'A',
            scope: {
              ngSrc: '@'
            },
            link: function (scope, element, attrs) {
                element.on('load', function() {
                    element.addClass('show');
                }).on('error', function() {
                  //
                });

                scope.$watch('ngSrc', function(newVal) {
                    element.removeClass('show');
                });
            }
        };
    }
})();
