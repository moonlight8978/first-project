(function () {
    'use strict';

    angular
        .module('app')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$rootScope', '$state', 'Auth', 'Principal', 'Token'];

    function LoginController($rootScope, $state, Auth, Principal, Token) {
        let self = this;

        self.signup = {};
        self.login = {};

        self.submitLogin = submitLogin;

        self.countries = [
            { id: 1, name: '日本', name_en: 'Japan' },
            { id: 1, name: 'ベトナム', name_en: 'Vietnam' }
        ];

        async function submitLogin(user) {
            try {
                await Auth.login(user);

                if ($rootScope.fromState.name) {
                    $state.go($rootScope.fromState, $rootScope.fromStateParams);
                } else {
                    $state.go('home');
                }
            } catch (e) {
                self.login.error = e;
            }
        }
    }
})();
