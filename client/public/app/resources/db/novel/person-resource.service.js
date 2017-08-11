(function () {
    'use strict';

    angular
        .module('app')
        .factory('PersonResource', PersonResource);

    PersonResource.$inject = ['$resource', 'SERVER'];

    function PersonResource($resource, server) {
        let personUrl = server.api + '/db/people/:id';
        let searchUrl = server.search + '/people'

        let service = {
            person: personRsrc(),
            search: searchRsrc()
        };

        return service;

        function personRsrc() {
            return $resource(personUrl, {}, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }

        function searchRsrc() {
            return $resource(searchUrl, {}, {
                'query':  { method: 'GET', isArray: true }
            });
        }
    }
})();
