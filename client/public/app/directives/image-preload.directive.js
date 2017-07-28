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
                element
                    .on('load', loadFunc)
                    .on('error', errorFunc);

                scope.$watch('ngSrc', function(newVal) {
                    element.removeClass('show');
                });

                scope.$on('$destroy', () => {
                    unbind();
                });

                function loadFunc() {
                   element.addClass('show');
                }

                function errorFunc() {
                    // body...
                }

                function unbind() {
                    element.off('load', loadFunc);
                    element.off('error', errorFunc)
                }
            }
        };
    }
})();
