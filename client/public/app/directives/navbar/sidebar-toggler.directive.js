(function () {
    'use strict';

    angular
        .module('app')
        .directive('sidebarToggler', sidebarToggler);

    function sidebarToggler() {
        return {
            restrict: 'A',
            scope: {
              target: '@'
            },
            link: function (scope, element, attrs) {
                angular.element(document).ready(function () {
                    let sidebar = $(scope.target);

                    $(element).on('click', clickFunc);

                    function clickFunc() {
                        // $('body').toggleClass('active');
                        // $('.sidebar-left-wrap').toggleClass('active');
                        // $(scope.target).toggleClass('active');
                        sidebar.toggleClass('active');
                    }

                    scope.$on('$destroy', unbind)

                    function unbind() {
                        $(element).off('click', clickFunc);
                    }
                });

            }
        };
    }
})();
