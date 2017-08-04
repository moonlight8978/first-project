(function () {
    'use strict';

    angular
        .module('app')
        .factory('CharacterResource', CharacterResource);

    CharacterResource.$inject = ['$resource', 'SERVER'];

    function CharacterResource($resource, server) {
        let characterUrl = server.api + '/db/characters/:id';
        let vaUrl        = server.api + '/db/character_novels/:characterNovelId/voice_actresses/:id'
        let service = {
            character: characterRsrc(),
            va: vaRsrc()
        };

        return service;

        function characterRsrc() {
            return $resource(characterUrl, {}, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }

        function vaRsrc() {
            return $resource(vaUrl, {}, {
                'update': { method: 'PUT' },
                'get':    { method: 'GET' },
                'save':   { method: 'POST' }
            });
        }
    }
})();
