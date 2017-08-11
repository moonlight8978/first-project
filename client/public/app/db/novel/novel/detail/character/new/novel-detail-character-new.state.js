(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.detail.newCharacter', {
            url: '/characters/new',
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/detail/character/new/novel-detail-character-new.html',
                    controller: 'NovelDetailCharacterNewController',
                    controllerAs: 'vm'
                }
            },
            data: {
                roles: ['ROLE_USER']
            }
        });
    }
})();
