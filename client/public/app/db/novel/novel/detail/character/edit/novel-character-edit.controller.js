(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelCharacterEditController', NovelCharacterEditController);

    NovelCharacterEditController.$inject = ['$scope', '$state', 'novel', 'character'];

    function NovelCharacterEditController($scope, $state, novel, character) {
        console.log(novel);
        console.log(character);
        if (!character) {
            $state.go('novel.detail', novel.id);
        }
    }
})();
