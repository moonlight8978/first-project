(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelTagDetailEditController', NovelTagDetailEditController);

    NovelTagDetailEditController.$inject = ['$scope', 'tag', 'PageTitle', 'RemoveEmptyField', 'TagResource'];

    function NovelTagDetailEditController($scope, tag, PageTitle, RemoveEmptyField, TagResource) {
        PageTitle.set(`Edit ${tag.tag}`);

        let vm = this;
        const success = { 'message': 'Everythingは大丈夫！' };

        vm.oldTag = tag;

        vm.submit = submit;

        async function submit(_tag) {
            if ($scope.form.$pristine || $scope.form.$invalid)
                return false;

            console.log(_tag);
            reset();
            RemoveEmptyField.perform(_tag);

            try {
                console.log('WTF')
                await TagResource.tag
                    .update({ id: vm.oldTag.id }, _tag)
                    .$promise;

                vm.message = success;
            } catch (e) {
                vm.error = e.data;
                console.log(e)
            }
        }

        function reset() {
            delete vm.error;
            delete vm.message;
        }
    }
})();
