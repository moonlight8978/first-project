(function () {
    'use strict';

    angular
        .module('app')
        .directive('ckEdtior', ckEdtior);

    ckEdtior.$inject = [];

    function ckEdtior() {
        return {
            restrict: 'A',
            require: '?ngModel',
            link: function (scope, elm, attr, ngModel) {
                angular.element(document).ready(() => {
                    let ck = CKEDITOR.replace(elm[0]);

                    ck.on('pasteState', function () {
                        scope.$apply(function () {
                            ngModel.$setViewValue(ck.getData());
                        });
                    });

                    ngModel.$render = function (value) {
                        ck.setData(ngModel.$viewValue);
                    };
                });
            }
        };
    }
})();
