(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('login', {
            parent: 'app',
            url: '/login',
            data: {
                pageTitle: 'ログイン・サインアップ',
                notAllowMember: true
            },
            views: {
                'navbar@': {
                    templateUrl: 'app/layouts/navbar/navbar-fixed.html',
                    controller: 'NavbarController',
                    controllerAs: 'vm'
                },
                'content@': {
                    templateUrl: 'app/components/login/login.html',
                    controller: 'LoginController',
                    controllerAs: 'vm'
                },
                'footer@': {
                    templateUrl: 'app/layouts/footer/footer.html'
                }
            }
        });
    }
})();