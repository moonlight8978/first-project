(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelTagNewController', NovelTagNewController);

    NovelTagNewController.$inject = ['$scope', 'TagResource', 'RemoveEmptyField'];

    function NovelTagNewController($scope, TagResource, RemoveEmptyField) {
        let vm = this;
        const success = { 'message': 'Everythingは大丈夫！' };

        vm.submit = submit;

        async function submit(tag) {
            if ($scope.form.$pristine || $scope.form.$invalid)
                return false;

            reset();
            RemoveEmptyField.perform(tag);

            try {
                let response = await TagResource.tag
                    .save({}, tag)
                    .$promise;
                vm.message = success;
                console.log(response);
            } catch (e) {
                vm.error = e.data;
                console.log(e);
            }
        }

        function reset() {
            delete vm.error;
            delete vm.message;
        }
    }
})();
