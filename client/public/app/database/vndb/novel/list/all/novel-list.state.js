(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelList', {
            parent: 'vndb',
            url: '/novels',
            views: {
                'content@': {
                    templateUrl: 'app/database/vndb/novel/list/all/novel-list.html',
                    controller: 'NovelListController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
