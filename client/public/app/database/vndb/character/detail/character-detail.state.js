(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('characterDetail', {
            parent: 'vndb',
            url: '/characters/{id:int}',
            views: {
                'content@': {
                    templateUrl: 'app/database/vndb/character/detail/character-detail.html',
                    controller: 'CharacterDetailController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
