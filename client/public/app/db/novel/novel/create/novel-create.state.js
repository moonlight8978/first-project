(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.create', {
            url: '/new',
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/create/novel-create.html',
                    controller: 'NovelCreateController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
