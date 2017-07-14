(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelCreateController', NovelCreateController);

    NovelCreateController.$inject = ['NovelResource'];

    function NovelCreateController(NovelResource) {
        this.novel = {};

        this.submit = submit;
        // AJAX request to get informations about novel
        async function submit(novel) {
            standardized(novel);
            console.log(novel)
            let message = await NovelResource.novel.save({}, this.novel).$promise
            console.log(message);
        }

        function standardized(novel) {
            Object.keys(novel).forEach((key) => {
                if (typeof novel[key] === 'string') {
                    novel[key] = novel[key].replace(/\s+/, ' ')
                    console.log(novel[key])
                }
            });
        }
    }
})();
