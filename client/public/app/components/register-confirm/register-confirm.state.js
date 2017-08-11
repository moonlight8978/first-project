(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('confirmRegistration', {
            parent: 'app',
            url: '/register/confirm?email&token',
            data: {
                pageTitle: '登録を確認する',
                notAllowMember: true
            },
            views: {
                'content@': {
                    templateUrl: 'app/components/register-confirm/register-confirm.html',
                    controller: 'RegisterConfirmController',
                    controllerAs: 'vm'
                }
            }
        });
    }
})();
