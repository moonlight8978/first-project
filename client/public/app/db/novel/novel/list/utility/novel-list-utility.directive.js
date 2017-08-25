(function () {
    'use strict';

    angular
        .module('app')
        .directive('novelListUtility', novelListUtility);

    function novelListUtility() {
        return {
            restrict: 'A',
            scope: {
                hideNsfw: '='
            },
            templateUrl: 'app/db/novel/novel/list/utility/novel-list-utility.html',
            link: link, 
            controller: controller,
            controllerAs: 'vm',
            bindToController: true,
        };
        
        function link(scope, element, attrs) {
            
        }
        
        function controller() {
            const vm = this;
            
            vm.sort = {
                by: '',
                reverse: false,
            };
            
            vm.fixDropdown = fixDropdown;
            
            function fixDropdown($event) {
                $event.stopPropagation();
            }
        }
    }
})();
