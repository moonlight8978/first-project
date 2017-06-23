(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelSearch', {
            parent: 'vndb',
            url: '/novels/search?q',
            views: {
                'content@': {
                    templateUrl: 'app/database/vndb/novel/list/search/novel-search.html',
                    controller: 'NovelSearchController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
