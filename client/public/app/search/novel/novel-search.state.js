(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('search.novel', {
            url: '/novels?q',
            views: {
                'content@': {
                    templateUrl: 'app/search/novel/novel-search.html',
                    controller: 'NovelSearchController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
