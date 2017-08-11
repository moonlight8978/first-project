(function () {
    'use strict';

    angular
        .module('app')
        .factory('IsImage', IsImage);

    IsImage.$inject = ['$q'];

    function IsImage($q) {
        const service = {
            perform: perform
        };

        return service;

        function perform(src) {
            let deferred = $q.defer();

            let image = new Image();

            image.onerror = function () {
                deferred.resolve(false);
            };
            image.onload = function () {
                deferred.resolve(true);
            };

            image.src = src;

            return deferred.promise;
        }
    }
})();
