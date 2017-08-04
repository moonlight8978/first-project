(function () {
    'use strict';

    angular
        .module('app')
        .factory('AddVaModal', AddVaModal);

    AddVaModal.$inject = ['$uibModal'];

    function AddVaModal($uibModal) {
        let service = {
            open: open
        };

        let modalInstance = null;

        return service;

        function open(owner) {
            if (modalInstance !== null) return;

            modalInstance = $uibModal.open({
                animation: true,
                templateUrl: 'app/db/novel/novel/detail/character/edit/add_va/add-va.html',
                controller: 'AddVaController',
                controllerAs: 'vm',
                size: 'lg',
                backdrop: 'static',
                keyboard: false,
                resolve: {
                    owner: () => owner
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
