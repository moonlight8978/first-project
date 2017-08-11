(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelTag.new', {
            url: '/new',
            data: {
                pageTitle: '新しいタグを作る'
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel-tag/new/novel-tag-new.html',
                    controller: 'NovelTagNewController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
