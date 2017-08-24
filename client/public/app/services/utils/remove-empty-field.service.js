(function () {
    'use strict';

    angular
        .module('app')
        .factory('RemoveEmptyField', RemoveEmptyField);

    RemoveEmptyField.$inject = [];

    function RemoveEmptyField() {
        const service = {
            perform: perform
        };

        return service;

        function perform(object) {
            Object.keys(object).forEach((key) => {
                if (typeof object[key] != 'boolean' && !object[key]) {
                    delete object[key];
                }
            });
        }
    }
})();