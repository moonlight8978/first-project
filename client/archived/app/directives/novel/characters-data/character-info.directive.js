(function () {
    'use strict';

    angular
        .module('app')
        .directive('characterInfo', characterInfo);

    function characterInfo() {
        return {
            restrict: 'E',
            scope: {
              character: '='
            },
            templateUrl: 'app/directives/novel/characters-data/character-info.html',
            controller: ['$scope', 'CharacterResource', function ($scope, CharacterResource) {
                this.reqChar = {};
                this.reqVA = [];

                this.update = update;
                this.updateVA = updateVA;

                function update() {
                    this.reqChar && Object.keys(this.reqChar).forEach((key) => {
                        if (this.reqChar[key])
                            return;
                        else
                            delete this.reqChar[key];
                    });
                    console.log(this.reqChar);
                    CharacterResource.character.update(
                        { id: $scope.character.id },
                        this.reqChar,
                        (response) => {
                            console.log('Success');
                        }
                    );
                }

                function updateVA(va) {
                    va && Object.keys(va).forEach((key) => {
                        if (va[key])
                            return;
                        else
                            delete va[key];
                    });
                    console.log(this.reqVA);
                    console.log(va);
                }
            }],
            controllerAs: 'vm'
        };
    }
})();
