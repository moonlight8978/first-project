(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider', '$urlRouterProvider', '$locationProvider'];

    function stateConfig($stateProvider, $urlRouterProvider, $locationProvider) {
        $stateProvider.state('app', {
            url: '',
            abstract: true,
            views: {
                'navbar@': {
                    templateUrl: 'app/layouts/navbar/navbar.html',
                    controller: 'NavbarController',
                    controllerAs: 'vm'
                },
                'footer@': {
                    templateUrl: 'app/layouts/footer/footer.html'
                }
            }
        });

        $locationProvider.hashPrefix('');
        $urlRouterProvider.otherwise('/index');
    }
})();
