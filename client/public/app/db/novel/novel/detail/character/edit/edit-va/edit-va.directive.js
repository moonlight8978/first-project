(function () {
    'use strict';

    angular
        .module('app')
        .directive('editVa', editVa);

    function editVa() {
        const directive = {
            restrict: 'E',
            templateUrl: 'app/db/novel/novel/detail/character/edit/edit-va/edit-va.html',
            controller: 'EditVaController',
            controllerAs: 'vm',
            bindToController: true,
            scope: {
                voiceActresses: '='
            }
        }

        return directive;
    }
})();
