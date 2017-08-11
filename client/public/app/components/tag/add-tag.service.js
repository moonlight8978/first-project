(function () {
    'use strict';

    angular
        .module('app')
        .factory('TagModal', TagModal);

    TagModal.$inject = ['$uibModal'];

    function TagModal($uibModal) {
        let service = {
            open: open
        };

        let modalInstance = null;

        return service;

        function open(size, owner) {
            if (modalInstance !== null) return;

            modalInstance = $uibModal.open({
                animation: true,
                templateUrl: 'app/components/tag/add-tag.html',
                controller: 'TagModalController',
                controllerAs: 'vm',
                size: size,
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
