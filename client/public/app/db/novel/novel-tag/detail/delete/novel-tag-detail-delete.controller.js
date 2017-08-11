(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelTagDetailDeleteController', NovelTagDetailDeleteController);

    NovelTagDetailDeleteController.$inject = ['$scope', '$state', '$uibModalInstance', 'TagResource', 'resolve'];

    function NovelTagDetailDeleteController($scope, $state, $uibModalInstance, TagResource, resolve) {
        let vm = this;

        vm.tag = resolve;

        $scope.$on('closeDeleteModal', () => closeModal());

        $scope.$on('submitDelete', async () => await submitDelete());

        async function submitDelete() {
            reset();

            try {
                let response = await TagResource.tag
                    .delete({ id: vm.tag.id }, {})
                    .$promise;
                closeModal();
                $state.go('novelTag.list', {});
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
