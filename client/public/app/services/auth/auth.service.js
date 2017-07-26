(function () {
    'use strict';

    angular
        .module('app')
        .factory('Auth', Auth);

    Auth.$inject = ['$rootScope', '$http', '$state', '$q', '$localStorage', '$sessionStorage', 'Principal', 'JwtService', 'SERVER'];

    function Auth($rootScope, $http, $state, $q, $localStorage, $sessionStorage, Principal, JwtService, server) {
        const loginUrl = server.login;
        const logoutUrl = server.logout;

        const service = {
            login: login,
            logout: logout,
            checkExpiration: checkExpiration,
            authorize: authorize
        };

        return service;

        async function login(user, remember) {
            let deferred = $q.defer();

            try {
                // try to login
                let response = await $http.post(loginUrl, user);

                // login successful
                if (remember) {
                    store(response.data, response.headers('x-token'));
                } else {
                    temp(response.data, response.headers('x-token'));
                }

                Principal.authenticate();
                deferred.resolve(1);
            } catch (e) {
                // login failed
                deferred.reject(e.data);
            }

            return deferred.promise;

            function store(user, token) {
                $localStorage.user = user;
                $localStorage.authToken = token;
                $localStorage.exp = JwtService.decode(token)['exp'];
            }

            function temp(user, token) {
                $sessionStorage.user = user;
                $sessionStorage.authToken = token;
                $sessionStorage.exp = JwtService.decode(token)['exp'];
            }
        }

        function checkExpiration() {
            if (Principal.getExp() <= Math.floor(Date.now() / 1000)) {
                logout(true);
            }
        }

        function authorize() {
            let secureState =
                $rootScope.toState.data
                && $rootScope.toState.data.roles
                && $rootScope.toState.data.roles.length > 0;
            let isAuthenticated = Principal.isAuthenticated();

            if (secureState) {
                let isAuthorized = Principal.hasAnyRole($rootScope.toState.data.roles);
                if (!isAuthenticated) {
                    // Not logged in
                    // prevent original state from changing
                    $rootScope.event.preventDefault();
                    $state.go('errors.401');
                } else {
                    if (!isAuthorized) {
                        // Logged in but not in any roles
                        $rootScope.event.preventDefault();
                        $state.go('errors.403');
                    }
                }
            }
        }

        async function logout(force = false) {
            if (!force) {
                try {
                    await $http.post(logoutUrl);
                } catch (e) {
                    console.log(e);
                }
            }

            $localStorage.$reset();
            $sessionStorage.$reset();
            Principal.authenticate();
        }
    }
})();
