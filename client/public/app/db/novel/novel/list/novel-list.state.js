(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.list', {
            url: '/novels?length',
            params: {
                length: null
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/list/novel-list.html',
                    controller: 'NovelListController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
