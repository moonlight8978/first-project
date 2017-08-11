(function () {
    'use strict';

    angular
        .module('app')
        .factory('JwtService', JwtService);

    JwtService.$inject = [];

    function JwtService() {
        let service = {
            decode: decode
        };

        return service;

        function decode(token) {
            let base64Url = token.split('.')[1];
            let base64 = base64Url.replace('-', '+').replace('_', '/');
            return JSON.parse(window.atob(base64));
        }
    }
})();
