(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelDetail', {
            parent: 'vndb',
            url: '/novels/{id:int}',
            views: {
                'content@': {
                    templateUrl: 'app/database/vndb/novel/detail/novel-detail.html',
                    controller: 'NovelDetailController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
