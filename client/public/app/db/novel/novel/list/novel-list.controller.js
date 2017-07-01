(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelListController', NovelListController);

    NovelListController.$inject = ['$state', 'NovelResource', 'LENGTH', 'data'];

    function NovelListController($state, NovelResource, length, data) {
        this.length = length;

        this.novels = data.novels;
        this.totalNovels = data.headers["x-total"];
        this.page = data.headers["x-page"];
        this.perPage = data.headers["x-per-page"];
        this.totalPages = Math.ceil(this.totalNovels / this.perPage);

        this.pageChange = pageChange;
        this.formatDate = formatDate;

        function pageChange() {
            console.log(this.page);
            $state.go('novel.list', { page: this.page }, { reload: true });
        }

        function formatDate(dateString) {
            let year, month, date;
            [year, month, date] = dateString.split("-")
            return `${year}年${month}月${date}日`;
        }

        $.stellar({
            horizontalScrolling: false,
            verticalOffset: -250
        });

        // let request = {
        //     length: $stateParams.length,
        //     perPage: this.perPage,
        //     page: $stateParams.page
        // }

        // // AJAX request to get novels
        // NovelResource.novel.query({ perPage: request.perPage, page: request.page, 'length[]': request.length }, (novels, headers) => {
        //     this.novels = novels;
        //     this.totalNovels = headers('x-total');
        //     this.totalPages = Math.ceil(headers('x-total') / headers('x-per-page'));
        // });
    }
})();
