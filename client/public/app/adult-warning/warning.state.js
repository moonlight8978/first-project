(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('warning', {
            parent: 'app',
            url: '/warning',
            data: {
                'pageTitle': '年齢認証'
            },
            views: {
                'content@': {
                    templateUrl: 'app/adult-warning/warning.html'
                },
                'footer@': {}
            }
        });
    }
})();
