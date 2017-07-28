(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelCharacterController', NovelCharacterController);

    NovelCharacterController.$inject = ['$scope', '$state', 'novel', 'character'];

    function NovelCharacterController($scope, $state, novel, character) {
        console.log(novel);
        console.log(character);
        if (!character) {
            $state.go('novel.detail', novel.id);
        }
    }
})();
