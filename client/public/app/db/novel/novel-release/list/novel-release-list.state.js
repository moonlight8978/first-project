(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelRelease.list', {
            url: '?sort&reverse&filter&page&perPage',
            params: {
                sort: null,
                reverse: null,
                filter: null,
                page: '1',
                perPage: '10',
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel-release/list/novel-release-list.html',
                    controller: 'NovelReleaseListController',
                    controllerAs: 'vm'
                }
            },
        });
    }
})();
