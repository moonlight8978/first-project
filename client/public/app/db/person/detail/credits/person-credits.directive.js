(function () {
    'use strict';

    angular
        .module('app')
        .directive('personCredits', personCredits);

    function personCredits() {
        return {
            restrict: 'E',
            scope: {
                personId: '=',
                name: '=',
            },
            templateUrl: 'app/db/person/detail/credits/person-credits.html',
            bindToController: true,
            controller: 'PersonCreditsController',
            controllerAs: 'vm',
        };
    }
})();