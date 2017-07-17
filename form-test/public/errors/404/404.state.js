(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('errors.404', {
            url: '/404',
            views: {
                'main@': {
                    templateUrl: 'errors/404/404.html'
                }
            }
        });
    }
})();

