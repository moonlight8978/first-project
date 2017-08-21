(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('person', {
            parent: 'db',
            url: '/people',
            abstract: true,
        });
    }
})();
