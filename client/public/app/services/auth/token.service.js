(function () {
    'use strict';

    angular
        .module('app')
        .factory('Token', Token);

    Token.$inject = ['$localStorage'];

    function Token($localStorage) {
        const service = {
            'get': getToken,
            'delete': deleteToken,
            'store': storeToken
        };

        return service;

        function getToken() {
            return $localStorage.authToken || $sessionStorage.authToken;
        }

        function deleteToken() {
            delete $localStorage.authToken;
        }
    }
})();