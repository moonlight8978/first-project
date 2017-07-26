(function () {
    'use strict';

    angular
        .module('app')
        .factory('Auth', Auth);

    Auth.$inject = ['$rootScope', '$http', '$state', '$q', '$localStorage', 'Token', 'Principal', 'SERVER'];

    function Auth($rootScope, $http, $state, $q, $localStorage, Token, Principal, server) {
        const loginUrl = server.login;

        const service = {
            login: login,
            logout: logout,
            authorize: authorize
        };

        return service;

        async function login(user) {
            let deferred = $q.defer();

            try {
                // try to login
                let response = await $http.post(loginUrl, user);

                // login successful
                $localStorage.user = response.data;
                Token.store(response.headers('x-token'));
                Principal.authenticate();
                deferred.resolve(1);
            } catch (e) {
                // login failed
                deferred.reject(e.data);
            }

            return deferred.promise;
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

        function logout() {
            $localStorage.$reset();
        }
    }
})();
