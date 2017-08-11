(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('errors.404', {
            url: '/404',
            data: {
                pageTitle: 'Not found'
            },
            views: {
                'content@': {
                    templateUrl: 'app/errors/404-not-found/404.html'
                }
            }
        });
    }
})();
