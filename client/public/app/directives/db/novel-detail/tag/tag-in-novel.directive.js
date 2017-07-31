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
            link: link
        };

        function link(scope, element, attrs) {
            if (scope.tags)
                console.log(scope.tags)
            else
                console.log('loz')

            scope.open = () => {
                TagModal.open('lg', scope.novel);
            }
        }
    }
})();
