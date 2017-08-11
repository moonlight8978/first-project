(function () {
    'use strict';

    angular
        .module('app')
        .directive('tagInNovel', tagInNovel);

    tagInNovel.$inject = ['TagModal']

    function tagInNovel(TagModal) {
        return {
            restrict: 'E',
            scope: {
              tags: '=',
              type: '@',
              novel: '='
            },
            templateUrl: 'app/directives/db/novel-detail/tag/tag-in-novel.html',
            bindToController: true,
            controller: 'TagInNovelController',
            controllerAs: 'vm'
        };
    }
})();
