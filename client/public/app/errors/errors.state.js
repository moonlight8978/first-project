(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('errors', {
            parent: 'app',
            url: '/errors',
            abstract: true
        });
    }
})();
