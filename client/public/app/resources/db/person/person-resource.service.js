(function () {
    'use strict';

    angular
        .module('app')
        .factory('PersonResource', PersonResource);

    PersonResource.$inject = ['$resource', 'SERVER'];

    function PersonResource($resource, server) {
        const personUrl = server.api + '/db/people/:id';
        
        const service = {
            person: personResource(),
        };
        
        return service;
        
        function personResource() {
            return $resource(personUrl, {}, {
                get: { method: 'GET' },
                query: { method: 'GET', isArray: true },
                update: { method: 'PUT' },
                delete: { method: 'DELETE' },
            });
        }
    }
})();