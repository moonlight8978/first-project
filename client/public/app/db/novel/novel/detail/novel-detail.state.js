(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.detail', {
            url: '/novels/{id:int}',
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/detail/novel-detail.html',
                    controller: 'NovelDetailController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
