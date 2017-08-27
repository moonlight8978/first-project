(function () {
    'use strict';

    angular
        .module('app')
        .controller('PersonDetailController', PersonDetailController);

    PersonDetailController.$inject = ['$scope', '$state', '$stateParams', 'PersonResource', 'PageTitle', 'Principal'];
    
    function PersonDetailController($scope, $state, $stateParams, PersonResource, PageTitle, Principal) {
        const vm = this;
        
        vm.loading = true;
        
        $scope.$watch(() => Principal.isAuthenticated(), (value) => {
            vm.isAuthenticated = value;
        });
        $scope.$on('commentSubmitSuccess', (event, data) => {
            $scope.$broadcast('needToUpdateComment');
        });
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
