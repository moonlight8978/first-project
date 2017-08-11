(function () {
    'use strict';

    angular
        .module('app')
        .run(scrollTopConfig)

    scrollTopConfig.$inject = ['$rootScope'];

    function scrollTopConfig($rootScope) {
        $rootScope.$on('$stateChangeSuccess', function() {
            document.body.scrollTop = document.documentElement.scrollTop = 0;
        });
    }
})();
