(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelTag.detail.edit', {
            url: '/edit',
            data: {
                roles: ['ROLE_USER']
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel-tag/detail/edit/novel-tag-detail-edit.html',
                    controller: 'NovelTagDetailEditController',
                    controllerAs: 'vm'
                }
            },
            resolve: {

            }
        });
    }
})();
