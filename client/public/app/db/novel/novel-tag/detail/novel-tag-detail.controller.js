(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelTagDetailController', NovelTagDetailController);

    NovelTagDetailController.$inject = ['$state', 'tag', 'novels', 'PageTitle', 'TagResource', 'DeleteConfirm'];

    function NovelTagDetailController($state, tag, novels, PageTitle, TagResource, DeleteConfirm) {
        let vm = this;
        const noMore = { 'message': 'There is no more...' };
        PageTitle.set(tag.tag);

        vm.tag = tag;
        vm.novels = novels;
        vm.hideNsfw = true;

        vm.loadMore = loadMore;
        vm.delete = () => {
            DeleteConfirm.open(
                'NovelTagDetailDeleteController',
                'app/db/novel/novel-tag/detail/delete/novel-tag-detail-delete.html',
                this.tag
            );
        }

        function loadMore() {
            if (vm.novels.page < vm.novels.totalPage) {
                TagResource.novel.query(
                    { id: vm.tag.id, page: (parseInt(vm.novels.page) + 1) },
                    (novels, headers) => {
                        vm.novels.novels = vm.novels.novels.concat(novels);
                        vm.novels.perPage = headers('x-per-page');
                        vm.novels.total = headers('x-total');
                        vm.novels.page = headers('x-page');
                    },
                    (error) => {
                        console.log(error);
                    }
                );
            } else {
                vm.error = noMore;
            }
        }

        console.log(tag);
        console.log(novels);
    }
})();