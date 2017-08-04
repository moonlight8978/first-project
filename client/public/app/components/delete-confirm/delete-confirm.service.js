(function () {
    'use strict';

    angular
        .module('app')
        .factory('DeleteConfirm', DeleteConfirm);

    DeleteConfirm.$inject = ['$uibModal'];

    function DeleteConfirm($uibModal) {
        let service = {
            open: open
        };

        let modalInstance = null;

        return service;

        function open(controller, templateUrl, resolve) {
            if (modalInstance !== null) return;

            modalInstance = $uibModal.open({
                animation: true,
                templateUrl: templateUrl,
                controller: controller,
                controllerAs: 'vm',
                size: 'md',
                backdrop: 'static',
                keyboard: false,
                resolve: {
                    resolve: () => resolve
                }
            });

            modalInstance.result.then(
                resetModal,
                resetModal
            );
        }

        function resetModal() {
            modalInstance = null;
        }
    }
})();
