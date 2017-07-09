(function () {
    'use strict';

    angular
        .module('app')
        .directive('enableSidebar', enableSidebar);

    function enableSidebar() {
        return {
            restrict: 'A',
            scope: {
              target: '@',
              container: '@'
            },
            link: function (scope, element, attrs) {
                angular.element(document).ready(function () {
                    let container = $(scope.container);

                    $(element).click(() => {
                        // $('body').toggleClass('active');
                        // $('.sidebar-left-wrap').toggleClass('active');
                        // $(scope.target).toggleClass('active');
                        container.addClass('active');
                    });

                    $(window).click((event) => {
                        if (('#' + event.target.id) == scope.container)
                            container.removeClass('active');
                    });
                });
            }
        };
    }
})();
