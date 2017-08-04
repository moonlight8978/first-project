(function () {
    'use strict';

    angular
        .module('app')
        .controller('CharacterDetailController', CharacterDetailController);

    CharacterDetailController.$inject = ['character', 'PageTitle'];

    function CharacterDetailController(character, PageTitle) {
        const vm = this;

        PageTitle.set(`${character.name} / キャラクター`);
        console.log(character);

        vm.character = character;
        vm.hideNsfw = true;
    }
})();
