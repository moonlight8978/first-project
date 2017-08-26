(function () {
    'use strict';

    angular
        .module('app')
        .controller('CharacterDetailController', CharacterDetailController);

    CharacterDetailController.$inject = ['$http', '$timeout', 'character', 'PageTitle'];

    function CharacterDetailController($http, $timeout, character, PageTitle) {
        const vm = this;

        PageTitle.set(`${character.name} / キャラクター`);
        console.log(character);

        vm.character = character;
        vm.hideNsfw = true;
    }
})();
