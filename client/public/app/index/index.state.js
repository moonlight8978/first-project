(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('index', {
            url: '/index',
            views: {
                'navbar@': {
                    templateUrl: 'app/layouts/navbar/navbar-fixed.html',
                    controller: 'NavbarController',
                    controllerAs: 'vm'
                },
                'content@': {
                    templateUrl: 'app/index/index.html'
                }
            }
        });
    }
})();
