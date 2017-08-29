(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelReleaseListController', NovelReleaseListController);

    NovelReleaseListController.$inject = [
        '$scope', '$timeout', '$state', '$stateParams', 
        'ReleaseResource', 'PageTitle'
    ];
    
    function NovelReleaseListController(
        $scope, $timeout, $state, $stateParams, 
        ReleaseResource, PageTitle
    ) {
        const vm = this;
        
        // vm variables
        vm.loading = true;
        vm.page = $stateParams.page;
        vm.perPage = $stateParams.perPage;
        
        // vm functions
        vm.pageChange = pageChange;
        
        // inital funtions execute
        PageTitle.set(`リリース・${vm.page}`);
        getData();
        
        // functions declare
            // fetch people list from server
        function getData() {
            ReleaseResource.release.query({
                page: vm.page,
                perPage: vm.perPage,
            }, (releases, headers) => {
                vm.loading = false;
                vm.releases = releases;
                vm.total = headers('x-total');
                vm.totalPages = Math.ceil(vm.total / vm.perPage);
            });
        }
        
            // pageChange for uib-paginate
        function pageChange() {
            $state.go('novelRelease.list', { page: vm.page });
        }
        
        // life circle
        // $scope.$on('$destroy', function(event) {
        //     $timeout.cancel(timeout);
        // });
    }
})();