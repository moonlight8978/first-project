(function () {
    'use strict';

    angular
        .module('app')
        .controller('PersonDetailController', PersonDetailController);

    PersonDetailController.$inject = ['$scope', '$timeout', '$state', '$stateParams', 'PersonResource', 'PageTitle'];
    
    function PersonDetailController($scope, $timeout, $state, $stateParams, PersonResource, PageTitle) {
        const vm = this;
        
        vm.loading = true;
        vm.aliases = ['青葉りんご', '青葉りんご', '青葉りんご', '青葉りんご', '青葉りんご', '青葉りんご'];
        vm.positions = ['voice_actor', 'staff', 'vocals']
        
        vm.birthday = birthday;
        vm.alias = alias;
        vm.position = position;
        
        getData();
        
        async function getData() {
            try {
                vm.person = await PersonResource.person
                    .get({ id: $stateParams.id })
                    .$promise;
                console.log(vm.person);
                vm.loading = false;
            } catch (error) {
                console.log(error);
                $state.go(`errors.${error.status}`);
            }
        }
        
        function birthday() {
            return `${vm.person.birthdayYear || '?'}年` +
                   `${vm.person.birthdayMonth || '?'}月` +
                   `${vm.person.birthdayDay || '?'}日`;
        }
        
        function alias() {
            return vm.aliases.join('、');
        }
        
        function position() {
            return vm.positions.join('、');
        }
    }
})();
