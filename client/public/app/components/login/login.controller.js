(function () {
    'use strict';

    angular
        .module('app')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$rootScope', '$state', '$http', 'Auth'];

    function LoginController($rootScope, $state, $http, Auth) {
        let self = this;

        self.signup = {};
        self.login = {};

        self.submitLogin = submitLogin;
        self.submitSignup = submitSignup;

        self.countries = [
            { id: 1, name: '日本', name_en: 'Japan' },
            { id: 1, name: 'ベトナム', name_en: 'Vietnam' }
        ];

        async function submitLogin(user, remember) {
            delete self.login.error

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

        async function submitSignup(user) {
            let url = 'http://localhost:3000/api/register'
            delete self.signup.message
            delete self.signup.error

            try {
                let response = await $http.post(url, user);
                self.signup.message = `Please check your mail at ${user.email}`
            } catch (e) {
                self.signup.error = e.data;
            }
        }
    }
})();
