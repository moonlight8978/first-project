(function () {
    'use strict';

    angular
        .module('app')
        .factory('PersonResource', PersonResource);

    PersonResource.$inject = ['$resource', 'SERVER'];

    function PersonResource($resource, server) {
        const personUrl = server.api + '/db/people/:id';
        const vaUrl = `${server.api}/db/people/:id/voice_actresses`;
        const staffUrl = `${server.api}/db/people/:id/staffs`;
        
        let service = {
            person: personResource(),
            voiceActress: voiceActressResource(),
            staff: staffResource(),
        };

        return service;
        
        function personResource() {
            return $resource(personUrl, {}, {
                get: { method: 'GET' },
                query: { method: 'GET', isArray: true },
                update: { method: 'PUT' },
                delete: { method: 'DELETE' }
            });
        }
        
        function voiceActressResource() {
            return $resource(vaUrl, {}, {
                query: { method: 'GET', isArray: true }
            });
        }
        
        function staffResource() {
            return $resource(staffUrl, {}, {
                query: { method: 'GET', isArray: true }
            });
        }
    }
})();