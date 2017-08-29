(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelRelease.detail', {
            url: '/{id:int}',
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel-release/detail/novel-release-detail.html',
                    controller: 'NovelReleaseDetailController',
                    controllerAs: 'vm'
                }
            },
        });
    }
})();
