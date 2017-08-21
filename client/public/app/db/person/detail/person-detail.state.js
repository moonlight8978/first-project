(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('person.detail', {
            url: '/{id:int}',
            views: {
                'content@': {
                    templateUrl: 'app/db/person/detail/person-detail.html',
                    controller: 'PersonDetailController',
                    controllerAs: 'vm'
                }
            },
        });
    }
})();
