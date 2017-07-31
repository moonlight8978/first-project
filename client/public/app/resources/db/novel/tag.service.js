(function () {
    'use strict';

    angular
        .module('app')
        .factory('TagResource', TagResource);

    TagResource.$inject = ['$resource', 'SERVER'];

    function TagResource($resource, server) {
        let tagUrl      = server.api + '/db/novel_tags/:id';
        let searchUrl   = server.api + '/search/novel_tags';
        let novelUrl    = server.api + '/db/novel_tags/:id/novels';

        let service = {
            tag: tagRsrc(),
            search: searchRsrc(),
            novel: novelRsrc()
        };

        return service;

        function tagRsrc() {
            return $resource(tagUrl, {}, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }

        function searchRsrc() {
            return $resource(searchUrl, {
                'query': { method: 'GET', isArray: true }
            });
        }

        function novelRsrc(argument) {
            return $resource(novelUrl, {
                'query':  { method: 'GET', isArray: true }
            });
        }
    }
})();
