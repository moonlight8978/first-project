(function () {
    'use strict';

    angular
        .module('app')
        .controller('PersonListController', PersonListController);

    PersonListController.$inject = ['$scope', '$timeout', '$state', '$stateParams', 'PersonResource', 'PageTitle'];
    
    function PersonListController($scope, $timeout, $state, $stateParams, PersonResource, PageTitle) {
        const vm = this;
        
        // vm variables
        vm.loading = true;
        vm.page = $stateParams.page;
        vm.perPage = $stateParams.perPage;
        vm.positions = [
            'staff',
            'vocals',
            'composer',
            'voice_actor',
            'scenario',
            'artist',
        ];
        
        // vm functions
        vm.pageChange = pageChange;
        
        // inital funtions execute
            // wait 1.5s end fetch data
        const timeout = $timeout(getData, 1500);
        PageTitle.set(`スタフ・ページ${vm.page}`)
        
        // functions declare
            // fetch people list from server
        function getData() {
            PersonResource.person.query({
                page: vm.page,
                perPage: vm.perPage,
            }, (people, headers) => {
                vm.loading = false;
                vm.people = people;
                vm.total = headers('x-total');
                vm.totalPages = Math.ceil(vm.total / vm.perPage);
            });
        }
        
            // pageChange for uib-paginate
        function pageChange() {
            console.log(vm.page);
            $state.go('person.list', { page: vm.page });
        }
        
        // life circle
        $scope.$on('$destroy', function(event) {
            $timeout.cancel(timeout);
        });
    }
})();
