(function () {
    'use strict';

    angular
        .module('app')
        .controller('CharacterDetailController', CharacterDetailController);

    CharacterDetailController.$inject = ['$scope', '$timeout', 'character', 'PageTitle', 'Principal'];

    function CharacterDetailController($scope, $timeout, character, PageTitle, Principal) {
        const vm = this;
        
        PageTitle.set(`${character.name} / キャラクター`);
        console.log(character);
        
        $scope.$on('commentSubmitSuccess', (event, data) => {
            $scope.$broadcast('needToUpdateComment');
        });
        
        vm.isAuthenticated = Principal.isAuthenticated();
        vm.character = character;
        vm.hideNsfw = true;
    }
})();
