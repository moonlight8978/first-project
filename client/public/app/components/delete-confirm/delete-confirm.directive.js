(function () {
    'use strict';

    angular
        .module('app')
        .directive('deleteConfirm', deleteConfirm);

    deleteConfirm.$inject = ['$rootScope'];

    function deleteConfirm(rootScope) {
        return {
            restrict: 'E',
            scope: {
                'title': '=',
                'error': '=?'
            },
            templateUrl: 'app/components/delete-confirm/delete-confirm.html',
            link: link
        };

        function link (scope, element, attrs) {
            scope.closeModal = closeModal;
            scope.submitDelete = submitDelete;

            function submitDelete() {
                scope.$emit('submitDelete');
            }

            function closeModal() {
                scope.$emit('closeDeleteModal');
            }
        }
    }
})();
