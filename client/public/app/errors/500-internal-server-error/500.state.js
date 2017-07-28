(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('errors.500', {
            url: '/500',
            data: {
                pageTitle: '内部サーバーエラー'
            },
            views: {
                'content@': {
                    templateUrl: 'app/errors/500-internal-server-error/500.html'
                }
            }
        });
    }
})();
