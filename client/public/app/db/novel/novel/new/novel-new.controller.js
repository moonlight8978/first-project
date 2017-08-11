(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelNewController', NovelNewController);

    NovelNewController.$inject = ['$scope', 'NovelResource', 'RemoveEmptyField'];

    function NovelNewController($scope, NovelResource, RemoveEmptyField) {
        let vm = this;
        const success = { 'message': 'Everythingは大丈夫！' };

        /**
         * Novel
         * @property {string}    *title         - Novel's title in Japanese
         * @property {string}     titleEn       - Novel's title in English / Romaji
         * @property {int[0..4]} *length        - Novel's length
            (very_short, short, medium, long, very_long)
         * @property {text}       description   - Novel's description in Japanese
         * @property {text}       descriptionEn - Novel's description in English
         * @property {string}    *image         - Novel's image URL
            (http(s):// ... .[jpg|png|jpeg])
         * @property {boolean}   *imageNsfw     - 18+ image
         */
        vm.novel;

        vm.error; vm.message; vm.result; vm.hideNsfw;
        vm.length = [
            { id: 0, label: 'とても短い(Very short)' },
            { id: 1, label: '短い(Short)' },
            { id: 2, label: '並(Medium)' },
            { id: 3, label: '長い(Long)' },
            { id: 4, label: 'とても長い(Very long)' }
        ]

        vm.submit = submit;
        vm.resetAll = resetAll;
        vm.log = log;

        /**
         * Submit data for creating new novel
         * @param {Novel} novel - Novel need to be created
         */
        async function submit(_novel) {
            if ($scope.form.$pristine || $scope.form.$invalid)
                return false;

            reset();
            RemoveEmptyField.perform(_novel);

            try {
                let novel = await NovelResource.novel
                    .save({}, _novel)
                    .$promise;
                vm.result = novel;
                vm.message = success;
                console.log(novel);
            } catch (e) {
                vm.error = e.data;
                console.log(e);
            }
        }

        function reset() {
            delete vm.error;
            delete vm.message;
            delete vm.result;
        }

        function resetAll(form) {
            reset();
            delete vm.novel;
            $scope.form.$setPristine();
            $scope.form.$setUntouched();
        }

        function log() {
            console.log(vm.novel)
        }
    }
})();
