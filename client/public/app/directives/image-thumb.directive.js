(function () {
    'use strict';

    angular
        .module('app')
        .directive('imageThumb', imageThumb);

    function imageThumb() {
        return {
            restrict: 'AE',
            scope: {
                'condition': '=',
                'image': '@',
                'nsfw': '@'
            },
            link: function (scope, element) {
                let urlNsfw = `url('${scope.nsfw}')`;
                let urlImg = `url('${scope.image}')`;

                scope.$watch(() => {
                    return scope.condition;
                }, (value) => {
                    element.css(
                        'background-image',
                        (value ? urlNsfw : urlImg)
                    );
                });
            }
        };
    }
})();
