(function () {
    'use strict';

    angular
        .module('app')
        .directive('sidebar', sidebar);

    function sidebar() {
        return {
            restrict: 'A',
            link: function (scope, element, attrs) {
                angular.element(document).ready(function () {
                    let sidebar = $(element);

                    $(window).on('click.disableSidebar', (event) => {
                        if (event.target == sidebar[0]) {
                            sidebar.removeClass('active');
                        }
                    });
                });
            }
        };
    }
})();
