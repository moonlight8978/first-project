(function () {
    'use strict';

    angular
        .module('app')
        .directive('novelDetailMainInfo', novelDetailMainInfo);

    function novelDetailMainInfo() {
        const directive = {
            restrict: 'A',
            scope: {
                novel: '=',
                hideNsfw: '='
            },
            templateUrl: 'app/db/novel/novel/detail/novel-detail-main-info.html',
            controller: controller,
            controllerAs: 'vm',
            bindToController: true,
            link: link
        };

        return directive;
        
        function link() {
            
        }
        
        function controller() {
            const vm = this;
        }
    }
})();
