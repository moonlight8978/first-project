(function () {
    'use strict';

    angular
        .module('app')
        .factory('Auth', Auth);

    Auth.$inject = ['$rootScope', '$location', '$http', '$state', '$q', '$localStorage', '$sessionStorage', 'Principal', 'JwtService', 'SERVER'];

    function Auth($rootScope, $location, $http, $state, $q, $localStorage, $sessionStorage, Principal, JwtService, server) {
        const loginUrl = server.login;
        const logoutUrl = server.logout;

        const service = {
            login: login,
            logout: logout,
            checkExpiration: checkExpiration,
            authorize: authorize,
            storeSession: storeSession,
        };

        return service;

        async function login(user, remember) {
            let deferred = $q.defer();

            try {
                // try to login
                const response = await $http.post(loginUrl, user);
                
                // login successful
                const session = {
                    user: response.data,
                    token: response.headers('x-token'),
                }
                storeSession(session, remember);

                Principal.authenticate();
                deferred.resolve(1);
            } catch (e) {
                // login failed
                deferred.reject(e.data);
            }

            return deferred.promise;

            
        }

        function checkExpiration() {
            if (Principal.getExp() <= Math.floor(Date.now() / 1000)) {
                logout(true);
            }
        }

        function authorize() {
            let notAllowMember =
                $rootScope.toState.data
                && $rootScope.toState.data.notAllowMember;
            let secureState =
                $rootScope.toState.data
                && $rootScope.toState.data.roles
                && $rootScope.toState.data.roles.length > 0;
            let isAuthenticated = Principal.isAuthenticated();

            if (notAllowMember) {
                // Not allow member route > All
                if (isAuthenticated) {
                    $rootScope.event.preventDefault();
                    $state.go('errors.not-allow-member');
                }
            } else if (secureState) {
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

        // function unauthorize() {
        //     let isAuthenticated = Principal.isAuthenticated();

        //     if (isAuthenticated) {
        //         $rootScope.event.preventDefault();
        //         $location.path('/errors/not_allow_member')
        //         $state.go('errors.not-allow-member');
        //     }
        // }

        async function logout(tokenExpired = false) {
            try {
                auth2.isSignedIn.get() && (await auth2.signOut());
            } catch (e) {
                return;
            }
            
            FB.getLoginStatus((response) => {
                response.status === 'connected' && fbLogout();
            });
            
            try {
                tokenExpired || await $http.post(logoutUrl);
            } catch (e) {
                console.log(e);
            }

            $localStorage.$reset();
            $sessionStorage.$reset();
            Principal.authenticate();
            
            function fbLogout() {
                FB.logout((response) => {
                    console.log('FB Logged out');
                });
            }
        }
        
        function storeSession({ user, token }, rememberMe = false) {
            if (rememberMe) {
                $localStorage.user = user;
                $localStorage.authToken = token;
                $localStorage.exp = JwtService.decode(token)['exp'];
            } else {
                $sessionStorage.user = user;
                $sessionStorage.authToken = token;
                $sessionStorage.exp = JwtService.decode(token)['exp'];
            }
        }
    }
})();
