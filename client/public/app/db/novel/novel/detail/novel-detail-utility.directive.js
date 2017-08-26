(function () {
    'use strict';

    angular
        .module('app')
        .directive('novelDetailUtility', novelDetailUtility);

    function novelDetailUtility() {
        return {
            restrict: 'A',
            scope: {
                hideNsfw: '=',
                novel: '='
            },
            templateUrl: 'app/db/novel/novel/detail/novel-detail-utility.html',
            link: link, 
            controller: controller,
            controllerAs: 'vm',
            bindToController: true,
        };
    }
    
    function link(scope, element, attrs) {}
    
    controller.$inject = ['DeleteConfirm'];
    
    function controller(DeleteConfirm) {
        const vm = this;
        
        vm.fixDropdown = fixDropdown;
        vm.destroy = destroy;
        
        function fixDropdown($event) {
            $event.stopPropagation();
        }
        
        function destroy() {
            DeleteConfirm.open(
                'NovelDetailDeleteController',
                'app/db/novel/novel/detail/delete/novel-detail-delete.html',
                vm.novel,
            );
        }
    }
})();
