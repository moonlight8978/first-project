(function () {
    'use strict';

    angular
        .module('app')
        .directive('novelCharacter', novelCharacter);

    function novelCharacter() {
        return {
            restrict: 'E',
            scope: {
              characters: '=',
              type:       '='
            },
            templateUrl: 'app/directives/database/vndb/novel/character/character.html'
        };
    }
})();
