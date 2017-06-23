(function () {
    'use strict';

    angular
        .module('app')
        .factory('NovelResource', NovelResource);

    NovelResource.$inject = ['$resource', 'SERVER'];

    function NovelResource($resource, server) {
        let novelUrl      = server.api + '/novels/:id';
        let staffUrl      = server.api + '/novels/:id/staffs';
        let characterUrl  = server.api + '/novels/:id/characters';
        let releaseUrl    = server.api + '/novels/:id/releases';
        let tagUrl        = server.api + '/novels/:id/tags';
        let producerUrl   = server.api + '/novels/:id/publications';
        let screenshotUrl = server.api + '/novels/:id/screenshots';
        let searchUrl     = server.search + '/novels'

        let service = {
            novel: novelRsrc(),
            staff: staffRsrc(),
            character: characterRsrc(),
            release: releaseRsrc(),
            tag: tagRsrc(),
            producer: producerRsrc(),
            screenshot: screenshotRsrc(),
            search: searchRsrc()
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
                'query':  { method: 'GET', isArray: true }
            });
        }

        function tagRsrc() {
            return $resource(tagUrl, {
                'query':  { method: 'GET', isArray: true }
            });
        }

        function producerRsrc() {
            return $resource(producerUrl, {
                'query':  { method: 'GET', isArray: true }
            });
        }

        function screenshotRsrc() {
            return $resource(screenshotUrl, {
                'query':  { method: 'GET', isArray: true }
            });
        }

        function searchRsrc() {
            return $resource(searchUrl, {
                'query':  { method: 'GET', isArray: true }
            });
        }
    }
})();
