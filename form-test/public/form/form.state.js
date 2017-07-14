(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('app.form', {
            url: '/form',
            views: {
                'main@': {
                    templateUrl: 'form/form.html',
                    controller: 'FormController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                char: function ($resource) {
                    return $resource('http://localhost:3000/api/db/characters/:id').get({ id: 8 })
                        .$promise
                }
            }
        });
    }
})();

