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
                    templateUrl: 'app/layouts/navbar/navbar-fixed.html',
                    controller: 'NavbarController',
                    controllerAs: 'vm'
                },
                'footer@': {
                    templateUrl: 'app/layouts/footer/footer.html'
                }
            },
            resolve: {
                authorize: function (Auth, Principal) {
                    Principal.authenticate();
                    Auth.checkExpiration();
                    Auth.authorize();
                    return 1;
                }
            }
        });

        $locationProvider.hashPrefix('');
        $urlRouterProvider.otherwise('/warning');
    }
})();
