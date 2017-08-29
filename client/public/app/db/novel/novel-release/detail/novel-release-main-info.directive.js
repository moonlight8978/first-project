(function () {
    'use strict';
    
    angular
        .module('app')
        .directive('novelReleaseMainInfo', novelReleaseMainInfo);
    
    function novelReleaseMainInfo() {
        const directive = {
            restrict: 'A',
            bindToController: true,
            controllerAs: 'vm',
            controller: controller,
            templateUrl: 'app/db/novel/novel-release/detail/novel-release-main-info.html',
            scope: {
                release: '=',
            },
        };
        
        return directive;
    }
    
    controller.$inject = [];
    
    function controller() {
        
    }
})();