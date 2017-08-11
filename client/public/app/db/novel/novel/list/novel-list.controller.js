(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelListController', NovelListController);

    NovelListController.$inject = ['$state', '$stateParams', 'NovelResource', 'LENGTH', 'data'];

    function NovelListController($state, $stateParams, NovelResource, length, data) {
        this.length = length;
        this.filter = {
            sort: $stateParams.sort,
            length: $stateParams.length
        }

        this.novels = data.novels;
        this.totalNovels = data.headers["x-total"];
        this.page = data.headers["x-page"];
        this.perPage = data.headers["x-per-page"];
        this.totalPages = Math.ceil(this.totalNovels / this.perPage);
        this.hideNsfw = true;

        this.pageChange = pageChange;
        this.formatDate = formatDate;

        function pageChange() {
            $state.go('novel.list', { page: this.page, sort: this.filter.sort, length: this.filter.length }, { reload: 'novel.list' });
        }

        function formatDate(dateString) {
            let year, month, date;
            [year, month, date] = dateString.split("-")
            return `${year}年${month}月${date}日`;
        }
    }
})();
