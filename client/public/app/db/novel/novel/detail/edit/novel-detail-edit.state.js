(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.detail.edit', {
            url: '/edit',
            data: {

            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/detail/edit/novel-detail-edit.html',
                    controller: 'NovelDetailEditController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
