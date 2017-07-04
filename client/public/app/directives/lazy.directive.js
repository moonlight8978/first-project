(function () {
    'use strict';

    angular
        .module('app')
        .directive('lazy', lazy);

    lazy.$inject = ['$timeout'];

    function lazy($timeout) {
        return {
            restrict: 'C',
            link: function (scope, element, attrs) {
                $timeout(function () {
                    $(element).lazyload({
                        effect : "fadeIn"
                    });
                }, 0);
            }
        };
    }
})();
