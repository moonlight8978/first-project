(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailCharacterNewController', NovelDetailCharacterNewController);

    NovelDetailCharacterNewController.$inject = ['$scope', '$state', 'novel', 'RemoveEmptyField', 'PageTitle', 'NovelResource'];

    function NovelDetailCharacterNewController($scope, $state, novel, RemoveEmptyField, PageTitle, NovelResource) {
        PageTitle.set('新しいキャラクター' + ' / ' + novel.title);

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

        vm.submitCreate = submitCreate;
        vm.resetAll = resetAll;

        async function submitCreate(character) {
            if ($scope.form.$pristine || $scope.form.$invalid)
                return false;

            console.log(character);
            reset();
            RemoveEmptyField.perform(character);
            console.log(character);

            try {
                let response = await NovelResource.character
                    .save({ novelId: vm.novel.id }, character)
                    .$promise;
                vm.message = success;
                $state.go('^', {}, { reload: true })
            } catch (e) {
                console.log(e);
                vm.error = e.data;
            }
        }

        function resetAll() {
            reset();
            delete vm.character;
            $scope.form.$setPristine();
            $scope.form.$setUntouched();
        }

        function reset() {
            delete vm.error;
            delete vm.message;
        }
    }
})();
