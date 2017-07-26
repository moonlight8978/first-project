(function () {
    'use strict';

    angular
        .module('app')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$rootScope', '$state', 'Auth'];

    function LoginController($rootScope, $state, Auth) {
        let self = this;

        self.signup = {};
        self.login = {};

        self.submitLogin = submitLogin;

        self.countries = [
            { id: 1, name: '日本', name_en: 'Japan' },
            { id: 1, name: 'ベトナム', name_en: 'Vietnam' }
        ];

        async function submitLogin(user, remember) {
            try {
                await Auth.login(user, remember);

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
