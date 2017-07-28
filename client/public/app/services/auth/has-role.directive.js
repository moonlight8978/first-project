(function () {
    'use strict';

    angular
        .module('app')
        .directive('hasRole', hasRole);

    hasRole.$inject = ['Principal'];

    function hasRole(Principal) {
        let directive = {
            restrict: 'A',
            scope: {
                authority: '@'
            },
            link: link
        };

        return directive;

        function link(scope, element, attrs) {
            let authorities = scope.authority.replace(/\s+/, '').split(',');

            function setVisibility() {
                let valid = Principal.hasAnyRole(authorities);

                if (valid) {
                    show();
                } else {
                    hide();
                }
            }

            function hide() {
                $(element).addClass('hidden-xs-up');
            }

            function show() {
                $(element).removeClass('hidden-xs-up');
            }

            scope.$watch(() => {
                return Principal.isAuthenticated();
            }, () => {
                setVisibility();
            });
        }
    }
})();
