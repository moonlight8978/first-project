(function () {
    'use strict';

    angular
        .module('app')
        .config(headerConfig);

    headerConfig.$inject = ['$httpProvider'];

    function headerConfig($httpProvider) {
        $httpProvider.defaults.useXDomain = true;
        delete $httpProvider.defaults.headers.common["X-Requested-With"];
        $httpProvider.defaults.headers.common["Accept"] = "application/json";
        $httpProvider.defaults.headers.common["Content-Type"] = "application/json";
    }
})();
