(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('db', {
            abstract: true,
            parent: 'app',
            url: '/db',
            views: {

            }
        });
    }
})();
