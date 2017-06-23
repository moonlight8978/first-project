(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailController', NovelDetailController);

    NovelDetailController.$inject = ['NovelResource', '$stateParams', 'LENGTH'];

    function NovelDetailController(NovelResource, $stateParams, length) {
        this.id = $stateParams.id;
        this.hideNsfw = true;
        this.length = length.full

        // AJAX request to get informations about novel
        NovelResource.novel.get({ id: this.id, fullInfo: 1 }, (novel) => {
            this.novel = novel;
        });
    }
})();
