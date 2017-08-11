(function () {
    'use strict';

    angular
        .module('app')
        .controller('TagModalController', TagModalController);

    TagModalController.$inject = ['$rootScope', '$state', '$uibModalInstance', 'TagResource', 'NovelResource', 'owner'];

    function TagModalController($rootScope, $state, $uibModalInstance, TagResource, NovelResource, owner) {
        let vm = this;
        vm.tags = [];
        vm.owner = owner;

        vm.search = search;
        vm.addTag = addTag;
        vm.pageChange = pageChange;
        vm.goNew = goNew;
        vm.closeModal = closeModal;

        async function search(query, page = 1) {
            vm.done = false;
            reset();
            vm.tags = [];
            TagResource.search.query({ q: query, page: page }, then, hasError);

            function then(tags, headers) {
                console.log(headers());
                vm.currentPage = headers('x-page');
                vm.total = headers('x-total');
                vm.perPage = headers('x-per-page');
                console.log(vm.currentPage)
                console.log(vm.total)
                console.log(vm.perPage)
                vm.tags = tags;
                vm.messages = 'Everythingは大丈夫！';
                vm.done = true;
            }

            function hasError(error) {
                vm.done = true;
                vm.error = e.data;
                console.log(e);
            }
        }

        function pageChange() {
            console.log('change');
            search(vm.query, vm.currentPage);
        }

        async function addTag(tag) {
            reset();

            try {
                let response = await NovelResource.tag
                    .save({ novelId: vm.owner.id, id: tag.id }, {})
                    .$promise;
                $rootScope.$broadcast('tagAdded', (tag));
                vm.message = 'Everythingは大丈夫！';
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

        function goNew() {
            closeModal();
            $state.go('novelTag.new');
        }

        function closeModal(argument) {
            $uibModalInstance.dismiss();
        }
    }
})();
