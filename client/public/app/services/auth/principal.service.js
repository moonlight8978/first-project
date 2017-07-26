(function () {
    'use strict';

    angular
        .module('app')
        .factory('Principal', Principal);

    Principal.$inject = ['$http', '$localStorage', 'SERVER'];

    function Principal($http, $localStorage, server) {
        let authenticated = false;
        let user = null;

        const service = {
            isAuthenticated: isAuthenticated,
            authenticate: authenticate,
            getUser: getUser,
            hasAnyRole: hasAnyRole
        };

        return service;

        function isAuthenticated() {
            authenticate();
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
            return $localStorage.user;
        }

        function authenticate() {
            user = $localStorage.user;
            authenticated = !!user;
        }
    }
})();
