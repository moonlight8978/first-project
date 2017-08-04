(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelCharacterEditController', NovelCharacterEditController);

    NovelCharacterEditController.$inject = ['$scope', '$state', 'novel', 'character', 'RemoveEmptyField', 'PageTitle', 'CharacterResource', 'AddVaModal'];

    function NovelCharacterEditController($scope, $state, novel, character, RemoveEmptyField, PageTitle, CharacterResource, AddVaModal) {
        if (!character) {
            $state.go('^');
        } else {
            PageTitle.set(`Edit ${character.name} / ${novel.title}`);
        }


        console.log(character);

        const vm = this;
        const success = { 'message': 'Everythingは大丈夫！' };

        vm.role = [
            { 'value': 'protagonist', 'label': '主人公'},
            { 'value': 'main', 'label': 'メインキャラクター'},
            { 'value': 'side', 'label': 'サポート'}
        ]
        vm.gender = [
            { 'value': 'male', 'label': '男' },
            { 'value': 'female', 'label': '女' }
        ]
        vm.bloodType = [
            { 'value': 'A', 'label': 'A' },
            { 'value': 'B', 'label': 'B' },
            { 'value': 'AB', 'label': 'AB' },
            { 'value': 'O', 'label': 'O' }
        ]

        vm.novel = novel;
        vm.oldCharacter = character;

        vm.submitUpdate = submitUpdate;
        vm.addVa = addVa;

        async function submitUpdate(character) {
            if ($scope.form.$pristine || $scope.form.$invalid)
                return false;

            console.log(character);
            reset();
            RemoveEmptyField.perform(character);

            try {
                let response = await CharacterResource.character
                    .update({ id: vm.oldCharacter.id }, character)
                    .$promise;
                vm.message = success;
                $state.go('^', {}, { reload: true })
            } catch (e) {
                console.log(e.data);
                vm.error = e.data;
            }
        }

        function reset(argument) {
            delete vm.error;
            delete vm.message;
        }

        function addVa() {
            AddVaModal.open(vm.oldCharacter);
        }
    }
})();
