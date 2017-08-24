(function () {
    'use strict';

    angular
        .module('app')
        .controller('PersonDetailController', PersonDetailController);

    PersonDetailController.$inject = ['$scope', '$timeout', '$state', '$stateParams', 'PersonResource', 'PageTitle'];
    
    function PersonDetailController($scope, $timeout, $state, $stateParams, PersonResource, PageTitle) {
        const vm = this;
        
        vm.loading = true;
        
        getData();
        
        async function getData() {
            try {
                vm.person = await PersonResource.person
                    .get({ id: $stateParams.id })
                    .$promise;
                console.log(vm.person);
                PageTitle.set(`${vm.person.name}・スタフ`);
                vm.loading = false;
            } catch (error) {
                console.log(error);
                vm.loading = false;
                $state.go(`errors.${error.status}`);
            }
        }
    }
})();
