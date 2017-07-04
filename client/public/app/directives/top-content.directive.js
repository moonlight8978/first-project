(function () {
    'use strict';

    angular
        .module('app')
        .directive('topContent', topContent);

    topContent.$inject = ['$timeout'];

    function topContent($timeout) {
        return {
            restrict: 'A',
            scope: {
                time: '='
            },
            link: function (scope, element, attrs) {
                $timeout(() => {
                    $(element).removeClass('hide');
                }, scope.time);
            }
        };
    }
})();
