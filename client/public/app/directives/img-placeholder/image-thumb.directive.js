(function () {
    'use strict';

    angular
        .module('app')
        .directive('imageThumb', imageThumb);

    imageThumb.$inject = ['IsImage'];

    function imageThumb(IsImage) {
        return {
            restrict: 'AE',
            scope: {
                'condition': '=',
                'image': '@',
                'nsfw': '@',
                'imageChange': '=?'
            },
            link: function (scope, element) {
                scope.$watch(() => scope.condition,
                    (value) => {
                        if (value) {
                            setBackgroundImage(true);
                        } else {
                            setBackgroundImage();
                        }
                    }
                );

                if (scope.imageChange) {
                    scope.$watch(() => scope.image,
                        () => setBackgroundImage()
                    );
                }

                async function setBackgroundImage(nsfw = false) {
                    let image = await img(nsfw);
                    element.css('background-image', image);
                }

                async function img(nsfw) {
                    if (scope.valid == null || scope.imageChange) {
                        scope.valid = await IsImage.perform(scope.image);
                    }

                    if (scope.image && scope.valid) {
                        if (nsfw) {
                            return `url('${scope.nsfw}')`;
                        } else {
                            return `url('${scope.image}')`;
                        }
                    } else {
                        return `url('/assets/img/no_img.png')`;
                    }
                }
            }
        };
    }
})();
