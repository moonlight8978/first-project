(function () {
    'use strict';

    angular
        .module('app')
        .directive('country', country);

    country.$inject = [];

    function country() {
        return {
            restrict: 'E',
            scope: {
                country: '=',
            },
            templateUrl: 'app/directives/country/country.html',
            link: function (scope) {
                scope.code = scope.country.code.toLowerCase();
            }
        };
    }
})();
