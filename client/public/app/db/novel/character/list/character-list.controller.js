(function () {
    'use strict';

    angular
        .module('app')
        .controller('CharacterListController', CharacterListController);

    CharacterListController.$inject = ['$scope', '$timeout', '$state', '$stateParams', 'CharacterResource', 'PageTitle'];
    function CharacterListController($scope, $timeout, $state, $stateParams, CharacterResource, PageTitle) {
        const vm = this;
        
        // vm variables
        vm.hideNsfw = true;
        vm.loading = true;
        vm.perPage = $stateParams.perPage;
        vm.page = $stateParams.page;
        
        // vm functions
        vm.pageChange = pageChange;
        
        // actions
        PageTitle.set(`キャラクター・ページ${vm.page}`);
            // AJAX request to get informations about character
        const timeout = $timeout(getData, 1500);
        
        // funtions declare
        function getData() {
            CharacterResource.character.query({
                'perPage': vm.perPage,
                'page': vm.page,
            }, (characters, headers) => {
                vm.loading = false;
                vm.characters = characters;
                vm.total = headers('x-total');
                vm.totalPages = Math.ceil(vm.total / vm.perPage);
                console.log(vm.characters);
            });
        }
        
        function pageChange() {
            $state.go('character.list', { page: vm.page });
        }
        
        // life circle
        $scope.$on('$destroy', function(event) {
            $timeout.cancel(timeout);
        });
    }
})();
