(function () {
    'use strict';

    angular
        .module('app')
        .factory('NovelResource', NovelResource);

    NovelResource.$inject = ['$resource', 'SERVER'];

    function NovelResource($resource, server) {
        let novelUrl      = server.api + '/db/novels/:id';
        let staffUrl      = server.api + '/db/novels/:novelId/staffs';
        let characterUrl  = server.api + '/db/novels/:novelId/characters';
        let releaseUrl    = server.api + '/db/novels/:novelId/releases/:id';
        let tagUrl        = server.api + '/db/novels/:novelId/tags/:id';
        let producerUrl   = server.api + '/db/novels/:novelId/publications';
        let screenshotUrl = server.api + '/db/novels/:novelId/screenshots';
        let ratingUrl     = server.api + '/db/novels/:novelId/ratings/:userId'
        let searchUrl     = server.search + '/novels'

        let service = {
            novel: novelRsrc(),
            staff: staffRsrc(),
            character: characterRsrc(),
            release: releaseRsrc(),
            tag: tagRsrc(),
            producer: producerRsrc(),
            screenshot: screenshotRsrc(),
            search: searchRsrc(),
            rating: ratingRsrc()
        };

        return service;

        function novelRsrc() {
            return $resource(novelUrl, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }

        function staffRsrc() {
            return $resource(staffUrl, {
                'query': { method: 'GET', isArray: true },
                'get':   { method: 'GET' }
            });
        }

        function characterRsrc() {
            return $resource(characterUrl, {
                'query': { method: 'GET', isArray: true }
            });
        }

        function releaseRsrc() {
            return $resource(releaseUrl, {
                'query': { method: 'GET', isArray: true }
            });
        }

        function tagRsrc() {
            return $resource(tagUrl, {
                'query': { method: 'GET', isArray: true },
                'save': { method: 'POST' },
                'delete': { method: 'DELETE' }
            });
        }

        function producerRsrc() {
            return $resource(producerUrl, {
                'query': { method: 'GET', isArray: true }
            });
        }

        function screenshotRsrc() {
            return $resource(screenshotUrl, {
                'query': { method: 'GET', isArray: true }
            });
        }

        function searchRsrc() {
            return $resource(searchUrl, {
                'query': { method: 'GET', isArray: true }
            });
        }

        function ratingRsrc() {
            return $resource(ratingUrl, {
                'get': { method: 'GET' },
                'save': { method: 'POST' }
            });
        }
    }
})();
