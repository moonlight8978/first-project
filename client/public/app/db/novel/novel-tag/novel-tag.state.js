(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelTag', {
            parent: 'db',
            url: '/novel_tags',
            abstract: true
        });
    }
})();
