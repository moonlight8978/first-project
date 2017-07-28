(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.detail.editCharacter', {
            url: '/character/:characterId/edit',
            params: {
                'character': null
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/detail/character/novel-character.html',
                    controller: 'NovelCharacterController',
                    controllerAs: 'vm'
                }
            },
            data: {
                roles: ['ROLE_ADMIN']
            },
            resolve: {
                character: function ($stateParams) {
                    return $stateParams.character;
                }
            }
        });
    }
})();
