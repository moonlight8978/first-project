(function () {
    'use strict';

    angular
        .module('app')
        .directive('characterGroup', characterGroup);

    function characterGroup() {
        let directive = {
            restrict: 'E',
            scope: {
              characters: '=',
              novel: '='
            },
            templateUrl: 'app/db/novel/novel/detail/character/novel-detail-character.html',
            controller: 'NovelDetailCharacterController',
            controllerAs: 'vm',
            bindToController: true
        };

        return directive;
    }
})();
