(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novels', {
            parent: 'app',
            url: '/novels',
            views: {
                'content@': {
                    templateUrl: 'app/database/vndb/novels/novels.html',
                    controller: 'NovelsController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
