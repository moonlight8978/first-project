(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.detail.editCharacter', {
            url: '/characters/{characterId:int}/edit',
            params: {
                'character': null
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/detail/character/edit/novel-character-edit.html',
                    controller: 'NovelCharacterEditController',
                    controllerAs: 'vm'
                }
            },
            data: {
                roles: ['ROLE_USER']
            },
            resolve: {
                character: ($stateParams) => $stateParams.character
            }
        });
    }
})();
