(function () {
    'use strict';

    angular
        .module('app')
        .factory('AuthInterceptor', AuthInterceptor);

    AuthInterceptor.$inject = ['Principal'];

    function AuthInterceptor(Principal) {
        let interceptor = {
            request: function (config) {
                config.headers = config.headers || {};
                let token = Principal.getToken();

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
