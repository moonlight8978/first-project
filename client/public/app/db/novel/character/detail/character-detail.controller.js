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
        vm.comments = {
            data: [],
            done: false
        };
        vm.hideNsfw = true;
        
        $timeout(() => {
            $http.get('/comments.json')
                .then((response) => {
                    vm.comments.data = response.data;
                    vm.comments.done = true;
                });
        }, 3000);
    }
})();
