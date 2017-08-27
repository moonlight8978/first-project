(function () {
    'use strict';

    angular
        .module('app')
        .directive('writeComment', writeComment);

    function writeComment() {
        return {
            restrict: 'A',
            scope: {
                id: '=',
                type: '@',
                loading: '=',
            },
            templateUrl: 'app/components/write-comment/write-comment.html',
            bindToController: true,
            controller: controller,
            controllerAs: 'vm',
        };
    }
    
    controller.$inject = ['$scope', 'Principal', 'CommentApi'];
    
    function controller($scope, Principal, CommentApi) {
        const vm = this;
        
        vm.expanded = false;
        vm.submit = submit;
        vm.expand = expand;
        
        async function submit() {
            reset();
            
            try {
                const resComment = await CommentApi
                    .type(vm.type)
                    .save(
                        { commentableId: vm.id }, 
                        vm.comment,
                    )
                    .$promise;
                $scope.$emit('commentSubmitSuccess');
                vm.comment = {};
                vm.expanded = false;
                console.log(resComment);
            } catch (e) {
                console.log(e);
                vm.error = e.data;
            }
        }
        
        function expand() {
            vm.expanded = true;
        }
        
        function reset() {
            delete vm.error;
        }
        
        // $scope.$watch(() => vm.id, (value) => {
        //     if (value) {
        //         vm.loading = false;
        //     }
        // });
    }
})();
