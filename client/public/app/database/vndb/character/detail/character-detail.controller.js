(function () {
    'use strict';

    angular
        .module('app')
        .controller('CharacterDetailController', CharacterDetailController);

    CharacterDetailController.$inject = ['CharacterResource', '$stateParams'];

    function CharacterDetailController(CharacterResource, $stateParams) {
        this.id = $stateParams.id;
        this.hideNsfw = true;

        // AJAX request to get informations about character
        CharacterResource.character.get({ id: this.id }, (character) => {
            this.character = character;
        });
    }
})();
