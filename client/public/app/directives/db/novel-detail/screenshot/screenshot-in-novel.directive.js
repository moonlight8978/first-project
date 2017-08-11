(function () {
    'use strict';

    angular
        .module('app')
        .directive('screenshotInNovel', screenshotInNovel);

    function screenshotInNovel() {
        return {
            restrict: 'E',
            scope: {
              screenshots: '=',
              hideNsfw: '='
            },
            templateUrl: 'app/directives/db/novel-detail/screenshot/screenshot-in-novel.html',
            controller: function ($scope) {
                this.screenshots = $scope.screenshots;
                this.hideNsfw = $scope.hideNsfw;

                $(document).ready(function () {
                    let mainCarousel = $('.novel-screenshots');
                    let navCarousel = $('.novel-screenshots-nav');

                    mainCarousel.slick({
                        centerMode: true,
                        centerPadding: '0`',
                        slidesToShow: 3,
                        draggable: false,
                        asNavFor: '.novel-screenshots-nav',
                        arrows: false,
                        focusOnSelect: true,
                        responsive: [
                            {
                                breakpoint: 768,
                                settings: {
                                    arrows: false,
                                    centerMode: true,
                                    slidesToShow: 1,
                                    centerPadding: '125px',
                                    draggable: false,
                                    focusOnSelect: true
                                }
                            },
                            {
                                breakpoint: 480,
                                settings: {
                                    arrows: false,
                                    centerMode: true,
                                    centerPadding: '0',
                                    slidesToShow: 1
                                }
                            }
                        ]
                    });

                    navCarousel.slick({
                        slidesToShow: 3,
                        slidesToScroll: 1,
                        asNavFor: '.novel-screenshots',
                        dots: true,
                        draggable: false,
                        centerMode: true,
                        focusOnSelect: true,
                        variableWidth: true
                    });

                    $scope.$watch(() => {
                        return $scope.hideNsfw;
                    }, (value) => {
                        if (value) {
                            mainCarousel.slick('slickFilter', ':not(.nsfw-screenshot)');
                            navCarousel.slick('slickFilter', ':not(.nsfw-screenshot)');
                        } else {
                            mainCarousel.slick('slickUnfilter');
                            navCarousel.slick('slickUnfilter');
                        }
                    });
                });
            },
            controllerAs: 'vm'
        };
    }
})();
