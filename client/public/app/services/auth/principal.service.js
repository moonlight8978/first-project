(function () {
    'use strict';

    angular
        .module('app')
        .factory('Principal', Principal);

    Principal.$inject = ['$localStorage', '$sessionStorage', 'SERVER'];

    function Principal($localStorage, $sessionStorage, server) {
        let authenticated;
        let user;
        let token;
        let exp;

        const service = {
            isAuthenticated: isAuthenticated,
            authenticate: authenticate,
            getUser: getUser,
            getToken: getToken,
            getExp: getExp,
            hasAnyRole: hasAnyRole
        };

        return service;

        function isAuthenticated() {
            return authenticated;
        }

        function hasAnyRole(roles) {
            if (!authenticated || !user.roles) {
                return false;
            }

            let valid = false;
            roles.forEach((role) => {
                if (user.roles.indexOf(role) != -1) {
                    valid = true;
                    return;
                }
            });

            return valid;
        }

        function getUser() {
            return user;
        }

        function getToken() {
            return token;
        }

        function getExp() {
            return exp;
        }

        function authenticate() {
            exp = $localStorage.exp || $sessionStorage.exp;
            token = $localStorage.authToken || $sessionStorage.authToken;
            user = $localStorage.user || $sessionStorage.user;
            authenticated = !!user && !!token;
        }
    }
})();
