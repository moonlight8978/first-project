(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelSearchController', NovelSearchController);

    NovelSearchController.$inject = ['NovelResource', '$stateParams', 'LENGTH'];

    function NovelSearchController(NovelResource, $stateParams, length) {
        this.length = length;
        this.query = $stateParams.q
        // AJAX request to get novels
        NovelResource.search.query({ q: this.query, perPage: 10, page: 1 }, (novels) => {
            this.novels = novels;
        });
    }
})();
