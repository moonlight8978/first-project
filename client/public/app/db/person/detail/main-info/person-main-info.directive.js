(function () {
    'use strict';

    angular
        .module('app')
        .directive('personMainInfo', personMainInfo);

    function personMainInfo() {
        let directive = {
            restrict: 'A',
            scope: {
                person: '='
            },
            templateUrl: 'app/db/person/detail/main-info/person-main-info.html',
            controller: 'PersonMainInfoController',
            controllerAs: 'vm',
            bindToController: true
        };

        return directive;
    }
})();
