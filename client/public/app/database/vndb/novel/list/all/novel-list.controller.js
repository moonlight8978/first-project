(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelListController', NovelListController);

    NovelListController.$inject = ['NovelResource', 'LENGTH'];

    function NovelListController(NovelResource, length) {
        this.length = length;
        // AJAX request to get novels
        NovelResource.novel.query({ perPage: 10, page: 1}, (novels) => {
            this.novels = novels;
        });
    }
})();
