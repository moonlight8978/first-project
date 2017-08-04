(function () {
    'use strict';

    angular
        .module('app')
        .directive('novelDetailCharacter', novelDetailCharacter);

    novelDetailCharacter.$inject = ['DeleteConfirm'];

    function novelDetailCharacter(DeleteConfirm) {
        return {
            restrict: 'E',
            scope: {
              characters: '=',
              novel: '='
            },
            templateUrl: 'app/db/novel/novel/detail/character/novel-detail-character.html',
            controller: controller,
            controllerAs: 'vm'
        };

        function controller($scope) {
            let vm = this;

            vm.characters = $scope.characters;
            vm.type = $scope.type;
            vm.novelId = $scope.novel.id;

            vm.threeSizes = threeSizes;
            vm.birthday = birthday;

            vm.delete = (character) => {
                DeleteConfirm.open(
                    'NovelDetailCharacterDeleteController',
                    'app/db/novel/novel/detail/character/delete/novel-detail-character-delete.html',
                    { 'character': character,
                      'novelId': vm.novelId }
                );
            };

            function threeSizes(character) {
                return `${character.bust || '?'}-` +
                       `${character.waist || '?'}-` +
                       `${character.hips || '?'}`;
            }

            function birthday(character) {
                return `${character.birthdayMonth || '?'}月` +
                       `${character.birthdayDay || '?'}日`;
            }
        }
    }
})();
