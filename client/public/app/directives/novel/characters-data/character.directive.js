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
            templateUrl: 'app/directives/novel/characters-data/character.html',
            controller: ['CharacterResource', function (CharacterResource) {
                this.update = update;

                function update(character) {
                    CharacterResource.character.update(
                        { id: character.id },
                        character,
                        (response) => {
                            console.log('Success');
                        }
                    );
                }
            }],
            controllerAs: 'vm'
        };
    }
})();
