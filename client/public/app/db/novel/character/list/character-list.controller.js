(function () {
    'use strict';

    angular
        .module('app')
        .controller('CharacterListController', CharacterListController);

    CharacterListController.$inject = ['CharacterResource', '$stateParams'];

    function CharacterListController(CharacterResource, $stateParams) {
        this.hideNsfw = true;

        // AJAX request to get informations about character
        CharacterResource.character.query({ page: 1, perPage: 10 }, (characters) => {
            this.characters = characters;
        });
    }
})();
