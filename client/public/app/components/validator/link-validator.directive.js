(function () {
    'use strict';

    angular
        .module('app')
        .directive('linkValidator', linkValidator);

    linkValidator.$inject = [];

    function linkValidator() {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: link
        };

        function link (scope, element, attrs, ctrl) {
            var regex;

            if (attrs.ext) {
                let extensions = exts().join('|');
                regex = new RegExp(`^(http|https)\\:\\/\\/.+\\.(${extensions})$`);
            } else {
                regex = new RegExp('^(http|https)\\:\\/\\/.+$');
            }

            ctrl.$validators.link = (modelValue, viewValue) => {
                if (ctrl.$isEmpty(modelValue)) {
                    return true;
                }

                if (regex.test(viewValue)) {
                    return true;
                }

                return false;
            }

            // ngModel.$parsers.unshift((value) => {
            //     let valid = value.match(regex);
            //     ngModel.$setValidity('link', valid);
            //     return valid ? value : undefined;
            // });

            // ngModel.$formatters.unshift(function(value) {
            //     let valid = value.match(regex);
            //     ngModel.$setValidity('link', valid);
            //     return value;
            // });

            function exts() {
                return attrs.ext.replace(/\s+/, '').split(',');
            }
        }
    }
})();
