(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelListController', NovelListController);

    NovelListController.$inject = ['$stateParams', 'NovelResource', 'LENGTH'];

    function NovelListController($stateParams, NovelResource, length) {
        this.length = length;
        console.log($stateParams.length)
        // AJAX request to get novels
        NovelResource.novel.query({ perPage: 10, page: 1, 'length[]': $stateParams.length }, (novels) => {
            this.novels = novels;
        });
    }
})();
