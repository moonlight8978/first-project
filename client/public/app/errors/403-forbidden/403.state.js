(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('errors.403', {
            url: '/403',
            data: {
                pageTitle: 'Access denined'
            },
            views: {
                'content@': {
                    templateUrl: 'app/errors/403-forbidden/403.html'
                }
            }
        });
    }
})();
