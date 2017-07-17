(function () {
    'use strict'

    angular
        .module('app')
        .config(stateConfig)

    stateConfig.$inject = ['$stateProvider']

    function stateConfig($stateProvider) {
        $stateProvider.state('form', {
            parent: 'app',
            url: '/form',
            views: {
                'main@': {
                    templateUrl: 'form/form-character.html',
                    controller: 'FormController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                novel: function ($resource) {
                    return $resource('http://localhost:3000/api/db/novels/:id')
                        .get({ id: 2, fullInfo: 1 })
                        .$promise
                }
                // char: function ($resource) {
                //     return $resource('http://localhost:3000/api/db/characters/:id').get({ id: 8 })
                //         .$promise
                // }
            }
        })
    }
})()
