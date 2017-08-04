(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailDeleteController', NovelDetailDeleteController);

    NovelDetailDeleteController.$inject = ['$scope', '$state', '$uibModalInstance', 'NovelResource', 'resolve'];

    function NovelDetailDeleteController($scope, $state, $uibModalInstance, NovelResource, resolve) {
        let vm = this;

        vm.novel = resolve;

        $scope.$on('closeDeleteModal', () => closeModal());

        $scope.$on('submitDelete', async () => await submitDelete());

        async function submitDelete() {
            reset();

            try {
                let response = await NovelResource.novel
                    .delete({ id: vm.novel.id }, {})
                    .$promise;
                closeModal();
                $state.go('novel.list', {});
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
