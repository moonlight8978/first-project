(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailEditController', NovelDetailEditController);

    NovelDetailEditController.$inject = ['novel', 'PageTitle'];

    function NovelDetailEditController(novel, PageTitle) {
        // common
        let self = this;
        PageTitle.set(novel.title);
    }
})();
