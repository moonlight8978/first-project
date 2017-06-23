(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('vndb', {
            abstract: true,
            parent: 'database',
            url: '/vndb',
            views: {

            }
        });
    }
})();
