(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailCharacterDeleteController', NovelDetailCharacterDeleteController);

    NovelDetailCharacterDeleteController.$inject = ['$scope', '$state', '$uibModalInstance', 'NovelResource', 'resolve'];

    function NovelDetailCharacterDeleteController($scope, $state, $uibModalInstance, NovelResource, resolve) {
        let vm = this;

        console.log(resolve);

        vm.character = resolve.character;
        vm.novelId = resolve.novelId;

        $scope.$on('closeDeleteModal', () => closeModal());

        $scope.$on('submitDelete', async () => await submitDelete());

        async function submitDelete() {
            reset();

            try {
                let response = await NovelResource.character
                    .delete({ novelId: vm.novelId, id: vm.character.id }, {})
                    .$promise;
                closeModal();
                $state.reload();
            } catch (e) {
                vm.error = e.data;
                console.log(e);
            }
        }

        function reset() {
            delete vm.error;
        }

        function closeModal(argument) {
            $uibModalInstance.dismiss();
        }
    }
})();
