(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelsController', NovelsController);

    NovelsController.$inject = ['NovelService', '$resource'];

    function NovelsController(NovelService, $resource) {
        this.novel = [];
        this.staffs = [];

        NovelService.novel.get({ id: 1, aHiHi: 2, whatTheFuck: 3 }, (novel) => {
            this.novel = novel;
        });

        NovelService.novelStaff.get({ id: 1}, (staffs) => {
            this.staffs = staffs;
        });
    }
})();
