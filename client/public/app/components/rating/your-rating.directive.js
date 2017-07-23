(function () {
    'use strict';

    angular
        .module('app')
        .directive('yourRating', yourRating);

    yourRating.$inject = [];

    function yourRating() {
        return {
            restrict: 'A',
            scope: {
                'novel': '='
            },
            templateUrl: 'app/components/rating/your-rating.html',
            link: function (scope, elm, attr) {
                scope.selections = [
                    { star: 1, label: 'Appalling' },
                    { star: 2, label: 'Horrible' },
                    { star: 3, label: 'Very bad' },
                    { star: 4, label: 'Bad' },
                    { star: 5, label: 'Average' },
                    { star: 6, label: 'Fine' },
                    { star: 7, label: 'Good' },
                    { star: 8, label: 'Very good' },
                    { star: 9, label: 'Great' },
                    { star: 10, label: 'Masterpiece' }
                ];

                setTimeout(() => {
                    scope.userSelection = {
                        'id': 1,
                        'star': 10
                    };
                });
            }
        };
    }
})();
