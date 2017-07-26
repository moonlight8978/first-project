(function () {
    'use strict';

    angular
        .module('app')
        .directive('navFixed', navFixed);

    function navFixed() {
        let directive = {
            restrict: 'A',
            link: linkFunc
        };

        return directive;

        function linkFunc(scope, element, attrs) {
            angular.element(document).ready(() => {
                $(window).on('scroll.fixedNav', function () {
                    if ($(this).scrollTop() == 0) {
                        $(element).removeClass('active');
                    } else {
                        $(element).addClass('active');
                    }
                });
            });
        }
    }
})();
