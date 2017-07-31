(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelTagListController', NovelTagListController);

    NovelTagListController.$inject = ['$state', 'data'];

    function NovelTagListController($state, data) {
        let vm = this;

        vm.tags = data.tags;
        vm.perPage = data.perPage;
        vm.currentPage = data.currentPage;
        vm.totalTags = data.totalTags;
        vm.totalPages = Math.ceil(data.totalTags / data.perPage);

        vm.pageChange = pageChange;


        function pageChange() {
            $state.go('novelTag.list', { page: vm.currentPage });
        }

        console.log(data);
    }
})();
