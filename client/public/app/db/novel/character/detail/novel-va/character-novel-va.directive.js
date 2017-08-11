(function () {
    'use strict';

    angular
        .module('app')
        .directive('characterNovelVa', characterNovelVa);

    function characterNovelVa() {
        const directive = {
            restrict: 'E',
            templateUrl: 'app/db/novel/character/detail/novel-va/character-novel-va.html',
            controller: 'CharacterNovelVaController',
            controllerAs: 'vm',
            bindToController: true,
            scope: {
                novels: '='
            }
        }

        return directive;
    }
})();
