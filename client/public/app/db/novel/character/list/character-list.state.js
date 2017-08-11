(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('character.list', {
            url: '/characters?role',
            params: {
                role: null
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/character/list/character-list.html',
                    controller: 'CharacterListController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
