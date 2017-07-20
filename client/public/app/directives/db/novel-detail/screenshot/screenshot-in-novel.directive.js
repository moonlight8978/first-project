(function () {
    'use strict';

    angular
        .module('app')
        .directive('screenshotInNovel', screenshotInNovel);

    function screenshotInNovel() {
        return {
            restrict: 'E',
            scope: {
              screenshots: '='
            },
            templateUrl: 'app/directives/db/novel-detail/screenshot/screenshot-in-novel.html',
            controller: function ($scope) {
                this.screenshots = $scope.screenshots;
                $(document).ready(function () {
                    $('.your-class').slick({
                        centerMode: true,
                        centerPadding: '60px',
                        slidesToShow: 3,
                        responsive: [
                            {
                                breakpoint: 768,
                                settings: {
                                    arrows: false,
                                    centerMode: true,
                                    centerPadding: '40px',
                                    slidesToShow: 3
                                }
                            },
                            {
                                breakpoint: 480,
                                settings: {
                                    arrows: false,
                                    centerMode: true,
                                    centerPadding: '40px',
                                    slidesToShow: 1
                                }
                            }
                        ]
                    });
                });
            },
            controllerAs: 'vm'
        };
    }
})();
