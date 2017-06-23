(function () {
    'use strict';

    angular
        .module('app')
        .factory('ReleaseResource', ReleaseResource);

    ReleaseResource.$inject = ['$resource', 'SERVER'];

    function ReleaseResource($resource, server) {
        let releaseUrl      = server.api + '/releases/:id';

        let service = {
            release: releaseRsrc()
        };

        return service;

        function releaseRsrc() {
            return $resource(releaseUrl, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }
    }
})();
