(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailEditController', NovelDetailEditController);

    NovelDetailEditController.$inject = ['$scope', '$state', 'novel', 'PageTitle', 'RemoveEmptyField', 'NovelResource'];

    function NovelDetailEditController($scope, $state, novel, PageTitle, RemoveEmptyField, NovelResource) {
        PageTitle.set(`Edit ${novel.title}`);

        let vm = this;
        const success = { 'message': 'Everythingは大丈夫！' };

        vm.length = [
            { value: 'very_short', label: 'とても短い(Very short)' },
            { value: 'short', label: '短い(Short)' },
            { value: 'medium', label: '並(Medium)' },
            { value: 'long', label: '長い(Long)' },
            { value: 'very_long', label: 'とても長い(Very long)' }
        ]

        vm.oldNovel = novel;

        vm.submit = submit;
        vm.resetAll = resetAll;

        async function submit(_novel) {
            if ($scope.form.$pristine || $scope.form.$invalid)
                return false;

            console.log(_novel);
            reset();
            RemoveEmptyField.perform(_novel);
            console.log(_novel);

            try {
                await NovelResource.novel
                    .update({ id: vm.oldNovel.id }, _novel)
                    .$promise;
                vm.message = success;
                $state.reload();
            } catch (e) {
                vm.error = e.data;
                console.log(e)
            }
        }

        function reset() {
            delete vm.error;
            delete vm.message;
        }

        function resetAll() {
            reset();
            delete vm.novel;
            $scope.form.$setPristine();
            $scope.form.$setUntouched();
        }
    }
})();
