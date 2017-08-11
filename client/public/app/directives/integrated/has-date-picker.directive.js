(function () {
    'use strict';

    angular
        .module('app')
        .directive('hasDatePicker', hasDatePicker);

    hasDatePicker.$inject = [];

    function hasDatePicker() {
        return {
            restrict: 'A',
            require: 'ngModel',
            scope: {
                format: '@?'
            },
            link: function (scope, element, attrs, ngModel) {
                angular.element(document).ready(() => {
                    // init datepicker
                    $(element)
                        .datepicker({
                            dateFormat: scope.format || 'yy-mm-dd',
                            changeYear: !!scope.format
                        })
                        .on('input change', (e) => {
                            scope.$apply(() => {
                                ngModel.$setViewValue(e.target.value);
                            });
                        });

                    // set date by default
                    ngModel.$viewValue && $(element).datepicker('setDate', new Date(ngModel.$viewValue));
                });
            }
        };
    }
})();
