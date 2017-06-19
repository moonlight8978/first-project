(function () {
    'use strict';

    angular
        .module('app')
        .factory('NovelService', NovelService);

    NovelService.$inject = ['$resource'];

    function NovelService($resource) {
        let api = 'http://localhost:3000/api'

        let novel          = api + '/novels/:id';
        let novelStaff     = api + '/novels/:id/staffs';
        let novelCharacter = api + '/novels/:id/characters';
        let novelRelease   = api + '/novels/:id/releases';
        let novelTag       = api + '/novels/:id/tags';

        let service = {
            novel: novelRsrc(),
            novelStaff: novelStaffRsrc()
        };

        return service;

        function novelRsrc() {
            return $resource(novel, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }

        function novelStaffRsrc() {
            return $resource(novelStaff, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' }
            });
        }
    }
})();
