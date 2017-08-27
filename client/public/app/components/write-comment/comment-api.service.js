(function () {
    'use strict';

    angular
        .module('app')
        .factory('CommentApi', CommentApi);
    
    CommentApi.$inject = ['$resource', 'SERVER'];
    
    function CommentApi($resource, server) {
        const service = {
            type: type,
        };
        
        return service;
        
        function type(type) {
            return $resource(url(type), {}, {
                query: { method: 'GET', isArray: true },
                update: { method: 'PUT' },
                delete: { method: 'DELETE' },
                save: { method: 'POST' },
            });
        }
        
        function url(type) {
            let _type;
            
            switch (type) {
            case 'person':
                _type = 'people';
                break;
            case 'character':
                _type = 'characters';  
                break;  
            }
            
            return `${server.api}/db/${_type}/:commentableId/comments/:id`;
        }
    }
})();
