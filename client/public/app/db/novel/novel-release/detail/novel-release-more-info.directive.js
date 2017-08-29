(function () {
    'use strict';
    
    angular
        .module('app')
        .directive('novelReleaseMoreInfo', novelReleaseMoreInfo);
    
    function novelReleaseMoreInfo() {
        const directive = {
            restrict: 'A',
            bindToController: true,
            controllerAs: 'vm',
            controller: controller,
            templateUrl: 'app/db/novel/novel-release/detail/novel-release-more-info.html',
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