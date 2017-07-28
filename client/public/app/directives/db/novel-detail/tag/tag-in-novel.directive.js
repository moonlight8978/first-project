(function () {
    'use strict';

    angular
        .module('app')
        .directive('tagInNovel', tagInNovel);

    function tagInNovel() {
        return {
            restrict: 'E',
            scope: {
              tags: '='
            },
            templateUrl: 'app/directives/db/novel-detail/tag/tag-in-novel.html',
            link: link
        };

        function link(scope, element, attrs) {
            if (scope.tags)
                console.log(scope.tags)
            else
                console.log('loz')
        }
    }
})();
