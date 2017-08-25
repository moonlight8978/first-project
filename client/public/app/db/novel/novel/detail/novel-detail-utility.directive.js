(function () {
    'use strict';

    angular
        .module('app')
        .directive('novelDetailUtility', novelDetailUtility);

    function novelDetailUtility() {
        return {
            restrict: 'A',
            scope: {
                hideNsfw: '='
            },
            templateUrl: 'app/db/novel/novel/detail/novel-detail-utility.html',
            link: link, 
            controller: controller,
            controllerAs: 'vm',
            bindToController: true,
        };
        
        function link(scope, element, attrs) {
            
        }
        
        function controller() {
            const vm = this;
            
            vm.fixDropdown = fixDropdown;
            
            function fixDropdown($event) {
                $event.stopPropagation();
            }
        }
    }
})();
