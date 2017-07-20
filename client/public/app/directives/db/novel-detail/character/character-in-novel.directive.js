(function () {
    'use strict';

    angular
        .module('app')
        .directive('characterInNovel', characterInNovel);

    function characterInNovel() {
        return {
            restrict: 'E',
            scope: {
              characters: '=',
              type: '='
            },
            templateUrl: 'app/directives/db/novel-detail/character/character-in-novel.html',
            controller: function ($scope) {
                this.characters = $scope.characters;
                this.type = $scope.type;

                this.threeSizes = threeSizes;
                this.birthday = birthday;

                function threeSizes(character) {
                    return `${character.bust || '?'}-` +
                           `${character.waist || '?'}-` +
                           `${character.hips || '?'}`;
                }

                function birthday(character) {
                    return `${character.birthdayMonth || '?'}月` +
                           `${character.birthdayDay || '?'}日`;
                }
            },
            controllerAs: 'vm'
        };
    }
})();
