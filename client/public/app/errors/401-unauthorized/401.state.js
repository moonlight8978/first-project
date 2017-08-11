(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('errors.401', {
            url: '/401',
            data: {
                pageTitle: 'Login required'
            },
            views: {
                'content@': {
                    templateUrl: 'app/errors/401-unauthorized/401.html'
                }
            }
        });
    }
})();
