(function () {
    'use strict';

    angular
        .module('app')
        .directive('characterDetailUtility', characterDetailUtility);

    function characterDetailUtility() {
        return {
            restrict: 'A',
            scope: {
                character: '='
            },
            templateUrl: 'app/db/novel/character/detail/character-detail-utility.html',
            controller: controller,
            controllerAs: 'vm',
            bindToController: true,
        };
    }
    
    controller.$inject = ['DeleteConfirm'];
    
    function controller(DeleteConfirm) {
        const vm = this;
        
        vm.fixDropdown = fixDropdown;
        vm.destroy = destroy;
        
        function fixDropdown($event) {
            $event.stopPropagation();
        }
        
        function destroy() {
        }
    }
})();
