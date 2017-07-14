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
})();
