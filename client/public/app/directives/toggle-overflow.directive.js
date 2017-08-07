(function () {
    'use strict';

    angular
        .module('app')
        .directive('toggleOverflow', toggleOverflow);

    toggleOverflow.$inject = [];

    function toggleOverflow() {
        return {
            restrict: 'A',
            scope: {
                target: '@',
                lines: '=',
                fontSize: '='
            },
            link: function (scope, element, attrs) {
                angular.element(document).ready(function () {
                    let maxH = scope.lines * scope.fontSize * 16 * 1.5;
                    let text = $(scope.target);
                    let ele = $(element);
                    const moreTxt = '▼もっと見る';
                    const lessTxt = '▲閉じる';
                    console.log(text[0].scrollHeight)
                    console.log(maxH)
                    ele.html(moreTxt);
                    
                    if (text[0].scrollHeight > maxH) {
                        ele.css({ 'display': 'inline-block' });
                    }

                    $(window).on('resize.showMore', () => {
                        if (text[0].scrollHeight > maxH) {
                            ele.css({ 'display': 'inline-block' });
                        } else {
                            ele.css({ 'display': 'none' });
                        }
                    });

                    ele.on('click.showMore', () => {
                        text.toggleClass('active');
                        if (text.hasClass('active')) {
                            ele.html(lessTxt);
                        } else {
                            ele.html(moreTxt);
                        }
                    });

                    scope.$on('$destroy', unbind);

                    function unbind() {
                        $(window).off('resize.showMore');
                        ele.off('click.showMore');
                    }
                });
            }
        };
    }
})();
