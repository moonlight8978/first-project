(function () {
    'use strict';

    angular
        .module('app')
        .directive('review', review);

    review.$inject = [];

    function review() {
        const directive =  {
            restrict: 'A',
            scope: {
                'review': '='
            },
            templateUrl: 'app/components/review/review.html',
            controller: controller,
            controllerAs: 'vm',
            bindToController: true,
        };
        
        return directive;
    }
    
    function link() {
        
    }
    
    function controller() {
        const vm = this;
    }
})();
