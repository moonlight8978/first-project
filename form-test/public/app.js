(function () {
    'use strict';

    angular
        .module('app', [
            'ui.router',
            'ngMap',
            'angular-loading-bar',
            'ngStorage',
            'ngResource',
            'ui.bootstrap'
        ]);

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider', '$urlRouterProvider', '$locationProvider'];

    function stateConfig($stateProvider, $urlRouterProvider, $locationProvider) {
        $stateProvider.state('app', {
            url: '',
            abstract: true
        });

        $locationProvider.hashPrefix('');
        $urlRouterProvider.otherwise('/form');
    }

    angular
        .module('app')
        .run(runConfig);

    runConfig.$inject = ['$rootScope', '$state']

    function runConfig($rootScope, $state) {
        $rootScope.$on('$stateChangeError', (event, toState, toParams, fromState, fromParams, error) => {
            if (error) {
                event.preventDefault()
                $state.go(`errors.${error.status}`)
            }
        });
    }
})();

