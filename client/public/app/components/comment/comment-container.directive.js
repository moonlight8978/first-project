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
    
    controller.$inject = ['$scope', '$timeout', '$http'];
    
    function controller($scope, $timeout, $http) {
        const vm = this;
        
        // Variables
        vm.loading = true;
        vm.page = 1;
        vm.perPage = 6;
        vm.total = 20;
        
        // Functions
        vm.pageChange = pageChange;
        
        // Init functions
        $scope.$watch(() => vm.id, () => {
            $timeout(getData, 3000);
        })
        
        // Functions declare
        function pageChange() {
            // vm.viewComments = renderComment(vm.currentPage);
            // $('html, body').animate({
            //     scrollTop: $('#commentTop').offset().top - 20
            // }, 'slow');
        }
        
        function getData() {
            $http.get('/comments.json')
                .then((response) => {
                    vm.comments = response.data;
                    vm.loading = false;
                });
        }
    }
})();
