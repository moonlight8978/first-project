(function () {
    'use strict';

    angular
        .module('app')
        .factory('CompanyResource', CompanyResource);

    CompanyResource.$inject = ['$resource', 'SERVER'];

    function CompanyResource($resource, server) {
        let companyUrl      = server.api + 'db/companies/:id';

        let service = {
            company: companyRsrc()
        };

        return service;

        function companyRsrc() {
            return $resource(companyUrl, {
                'query':  { method: 'GET', isArray: true },
                'update': { method: 'PUT' },
                'get':    { method: 'GET' }
            });
        }
    }
})();
