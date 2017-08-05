(function () {
    'use strict';

    angular
        .module('app')
        .controller('AddVaController', AddVaController);

    AddVaController.$inject = ['$rootScope', '$scope', '$state', '$uibModalInstance', 'CharacterResource', 'PersonResource', 'owner'];

    function AddVaController($rootScope, $scope, $state, $uibModalInstance, CharacterResource, PersonResource, owner) {
        const vm = this;
        const success = { message: 'Everythingは大丈夫！' };

        // Setting for modal
        vm.modalTitle = `Add VA for ${owner.name}`;
        vm.goNewLink = '新しい人'
        vm.resultProperty = 'name';

        // resolves
        vm.owner = owner;
        vm.va = {};

        // functions
        vm.search = search;
        vm.pageChange = pageChange;
        vm.goNew = goNew;
        vm.closeModal = closeModal;
        vm.submitCreate = submitCreate;
        vm.resetVa = resetVa;
        vm.choose = choose;

        async function search(query, page = 1) {
            vm.done = false;
            reset();
            vm.results = [];
            PersonResource.search.query({ q: query, page: page }, then, hasError);

            function then(people, headers) {
                console.log(headers());
                vm.currentPage = headers('x-page');
                vm.total = headers('x-total');
                vm.perPage = headers('x-per-page');
                console.log(vm.currentPage)
                console.log(vm.total)
                console.log(vm.perPage)
                vm.results = people;
                vm.messages = success;
                vm.done = true;
            }

            function hasError(error) {
                vm.done = true;
                vm.error = e.data;
                console.log(e);
            }
        }

        function pageChange() {
            console.log('change');
            search(vm.query, vm.currentPage);
        }

        async function submitCreate(va) {
            reset();

            if ($scope.form.$invalid || !va.personId)
                return false;

            try {
                let newVa = await CharacterResource.va
                    .save({ characterNovelId: vm.owner.characterNovelId }, va)
                    .$promise;
                vm.message = success;
                $rootScope.$broadcast('vaAdded', newVa);
                console.log(newVa);
            } catch (e) {
                vm.error = e.data;
                console.log(e);
            }
        }

        function reset() {
            delete vm.error;
            delete vm.message;
        }

        function resetVa() {
            delete vm.va.personId;
            delete vm.va.person;
        }

        function choose(person) {
            vm.va.personId = person.id;
            vm.va.person = person;
        }

        function goNew() {
            closeModal();
            $state.go('index');
        }

        function closeModal(argument) {
            $uibModalInstance.dismiss();
        }
    }
})();
