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
                    if (text[0].scrollHeight > maxH) {
                        ele.css({ 'display': 'inline-block' });
                    }

                    ele.on('click.showMore', () => {
                        text.toggleClass('active');
                        if (text.hasClass('active')) {
                            ele.html('▲閉じる');
                        } else {
                            ele.html('▼もっと見る');
                        }
                    });
                });
            }
        };
    }
})();
