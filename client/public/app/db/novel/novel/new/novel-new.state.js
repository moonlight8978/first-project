(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.new', {
            url: '/new',
            data: {
                'pageTitle': '新しいノベルを作る'
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/new/novel-new.html',
                    controller: 'NovelNewController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
