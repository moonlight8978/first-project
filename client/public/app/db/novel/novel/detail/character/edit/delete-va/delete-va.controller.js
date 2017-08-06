(function () {
    'use strict';

    angular
        .module('app')
        .controller('DeleteVaController', DeleteVaController);

    DeleteVaController.$inject = ['$scope', '$state', '$uibModalInstance', 'CharacterResource', 'resolve'];

    function DeleteVaController($scope, $state, $uibModalInstance, CharacterResource, resolve) {
        let vm = this;

        vm.i = resolve.i;
        vm.va = resolve.va;
        vm.voiceActresses = resolve.voiceActresses;

        $scope.$on('closeDeleteModal', () => closeModal());

        $scope.$on('submitDelete', async () => await submitDelete());

        async function submitDelete() {
            reset();

            console.log(vm.va)

            try {
                await CharacterResource.va
                    .delete({ characterNovelId: 1, id: vm.va.id }, {})
                    .$promise;

                vm.message = { x: '成功でした。' }
                vm.voiceActresses.splice(vm.i, 1);
                closeModal();
            } catch (e) {
                vm.error = e.data;
                console.log(e);
            }
        }

        function reset() {
            delete vm.message;
            delete vm.error;
        }

        function closeModal() {
            $uibModalInstance.dismiss();
        }
    }
})();
