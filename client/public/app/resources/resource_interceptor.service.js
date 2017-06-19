(function () {
    'use strict';

    angular
        .module('app')
        .factory('ResourceInterceptor', ResourceInterceptor);

    ResourceInterceptor.$inject = [];

    function ResourceInterceptor() {
        var interceptor = {
            request: function(config) {
                config.headers['Content-Type'] = 'application/json';
                return config;
            }
        };

        return interceptor;
    }

    angular
        .module('app')
        .config(['$httpProvider', function($httpProvider) {
            $httpProvider.interceptors.push('ResourceInterceptor');
        }]);
})();
