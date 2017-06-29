(function () {
    'use strict';

    angular
        .module('app')
        .factory('TagResource', TagResource);

    TagResource.$inject = ['$resource', 'SERVER'];

    function TagResource($resource, server) {
        let tagUrl      = server.api + 'db/novels/tags/:id';

        let service = {
            tag: tagRsrc()
        };

        return service;

        function tagRsrc() {
            return $resource(tagUrl, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }
    }
})();
