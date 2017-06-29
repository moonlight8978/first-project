(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('character.detail', {
            url: '/characters/{id:int}',
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/character/detail/character-detail.html',
                    controller: 'CharacterDetailController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
