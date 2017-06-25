(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('test', {
            parent: 'app',
            url: '/',
            views: {
                'content@': {
                    templateUrl: 'app/test/test.html',
                    controller: 'TestController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
