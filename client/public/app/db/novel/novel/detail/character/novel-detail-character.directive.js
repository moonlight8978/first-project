(function () {
    'use strict';

    angular
        .module('app')
        .directive('novelDetailCharacter', novelDetailCharacter);

    function novelDetailCharacter() {
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
