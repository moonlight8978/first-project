(function () {
    'use strict';
    
    angular
        .module('app')
        .directive('reviewContainer', reviewContainer);
    
    function reviewContainer() {
        const directive =  {
            restrict: 'A',
            scope: {
                type: '@',
                id: '=',
            },
            templateUrl: 'app/components/review/review-container.html',
            controller: controller,
            controllerAs: 'vm',
            bindToController: true
        };
        
        return directive;
    }
    
    controller.$inject = ['$scope', '$http'];
    
    function controller($scope, $http) {
        const vm = this;
        
        // Variables
        vm.loading = true;
        vm.page = 1;
        vm.total = 20;
        vm.perPage = 5;
        
        // Functions
        vm.pageChange = pageChange;
        
        // Init functions
        $scope.$watch(() => vm.id, () => {
            getData();
        });
        
        // Functions declare
        function getData() {
            $http.get('/reviews.json')
                .then((response) => {
                    vm.reviews = response.data;
                    vm.loading = false;
                });
        }
        
        function pageChange() {
            
        }
    }
})();
