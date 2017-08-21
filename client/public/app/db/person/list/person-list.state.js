(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('person.list', {
            url: '?page&perPage',
            params: {
                page: '1',
                perPage: '10',
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/person/list/person-list.html',
                    controller: 'PersonListController',
                    controllerAs: 'vm'
                }
            },
        });
    }
})();
