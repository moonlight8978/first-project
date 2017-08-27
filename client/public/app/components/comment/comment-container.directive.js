(function () {
    'use strict';
    
    angular
        .module('app')
        .directive('commentContainer', commentContainer);
    
    function commentContainer() {
        const directive =  {
            restrict: 'A',
            scope: {
                id: '=',
                type: '@',
            },
            templateUrl: 'app/components/comment/comment-container.html',
            controller: controller,
            controllerAs: 'vm',
            bindToController: true
        };
        
        return directive;
    }
    
    controller.$inject = ['$scope', '$timeout', '$http', 'CommentApi'];
    
    function controller($scope, $timeout, $http, CommentApi) {
        const vm = this;
        
        // Variables
        vm.loading = true;
        vm.page = 1;
        vm.perPage = 6;
        
        // Functions
        vm.pageChange = pageChange;
        
        // Init functions
        $scope.$watch(() => vm.id, (value) => {
            if (value) {
                $timeout(getData, 3000);
            }
        });
        $scope.$on('needToUpdateComment', (event, data) => {
            getData();
        });
        
        // Functions declare
        function pageChange() {
            getData();
        }
        
        function getData() {
            CommentApi.type(vm.type)
                .query({ 
                    commentableId: vm.id, 
                    page: vm.page, 
                    perPage: vm.perPage,
                }, (comments, headers) => {
                    vm.comments = comments;
                    vm.total = headers('x-total');
                    vm.loading = false;
                }, (error) => {
                    vm.loading = false;
                    console.log(e);
                });          
        }
    }
})();
