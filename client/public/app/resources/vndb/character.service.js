(function () {
    'use strict';

    angular
        .module('app')
        .factory('CharacterResource', CharacterResource);

    CharacterResource.$inject = ['$resource', 'SERVER'];

    function CharacterResource($resource, server) {
        let characterUrl      = server.api + '/characters/:id';

        let service = {
            character: characterRsrc()
        };

        return service;

        function characterRsrc() {
            return $resource(characterUrl, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }
    }
})();
