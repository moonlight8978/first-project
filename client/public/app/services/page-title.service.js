(function () {
    'use strict';

    angular
        .module('app')
        .factory('PageTitle', PageTitle);

    PageTitle.$inject = ['$rootScope'];

    function PageTitle($rootScope) {
        const service = {
            set: setTitle
        };

        return service;

        function setTitle(pageTitle) {
            $rootScope.title = `${pageTitle} - にょろにょろ！`;
        }
    }
})();
