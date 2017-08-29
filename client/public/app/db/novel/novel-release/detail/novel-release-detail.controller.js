(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelReleaseDetailController', NovelReleaseDetailController);

    NovelReleaseDetailController.$inject = ['$scope', '$state', '$stateParams', 'ReleaseResource', 'PageTitle', 'Principal'];
    
    function NovelReleaseDetailController($scope, $state, $stateParams, ReleaseResource, PageTitle, Principal) {
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
                vm.release = await ReleaseResource.release
                    .get({ id: $stateParams.id })
                    .$promise;
                console.log(vm.release);
                PageTitle.set(`${vm.release.title}・リリース`);
                vm.loading = false;
            } catch (error) {
                console.log(error);
                vm.loading = false;
                $state.go(`errors.${error.status}`);
            }
        }
    }
})();
