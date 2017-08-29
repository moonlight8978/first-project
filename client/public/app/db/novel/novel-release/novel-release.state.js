(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelRelease', {
            parent: 'db',
            url: '/novel_releases',
            abstract: true
        });
    }
})();
