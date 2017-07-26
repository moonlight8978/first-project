(function () {
    'use strict';

    angular
        .module('app')
        .factory('AuthInterceptor', AuthInterceptor);

    AuthInterceptor.$inject = ['Token'];

    function AuthInterceptor(Token) {
        let interceptor = {
            request: function (config) {
                config.headers = config.headers || {};
                let token = Token.get();

                if (token) {
                    config.headers['Authorization'] = 'Bearer ' + token;
                }

                return config;
            }
        };

        return interceptor;
    }

    angular
        .module('app')
        .config(['$httpProvider', ($httpProvider) => {
            $httpProvider.interceptors.push('AuthInterceptor');
        }]);
})();
