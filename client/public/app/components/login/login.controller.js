(function () {
    'use strict';

    angular
        .module('app')
        .controller('LoginController', LoginController);

    LoginController.$inject = ['$rootScope', '$state', '$http', 'Auth', 'Principal', 'SocialLogin', 'SERVER'];

    function LoginController($rootScope, $state, $http, Auth, Principal, SocialLogin, server) {
        const self = this;
        const vm = this;
        const LOGIN_FACEBOOK = `${server.login}/facebook`;
        const LOGIN_GOOGLE = `${server.login}/google`;

        self.signup = {};
        self.login = {};

        self.submitLogin = submitLogin;
        self.submitSignup = submitSignup;
        self.googleLogin = googleLogin;
        self.facebookLogin = facebookLogin;
        self.twitterLogin = twitterLogin;

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

        async function googleLogin() {
            SocialLogin.google()
                .then(
                    (data) => console.log(data),
                    (error) => {
                        console.log(error);
                        vm.login.error = error;
                    }
                );
        }

        async function facebookLogin() {
            SocialLogin.facebook()
                .then(
                    (data) => console.log(data),
                    (error)  => {
                        console.log(error);
                        vm.login.error = error;
                    }
                );
        }
        
        async function loginToServer({ provider, auth_code }) {
            let credentials;
            switch (provider) {
            case 'google':
                credentials = await $http.post(LOGIN_GOOGLE, auth_code);
                auth(credentials);
                break;
            case 'facebook':
                credentials =  await $http.post(LOGIN_FACEBOOK, auth_code);
                auth(credentials);
                break;
            default:
                console.log('Provider is not match');
            }
            
            function auth(response) {
                const session = {
                    user: response.data,
                    token: response.headers('x-token'),
                }
                Auth.storeSession(session);
                Principal.authenticate();
            }
        }

        function twitterLogin() {
            console.log(auth2.isSignedIn.get());
        }
    }
})();
