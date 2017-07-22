(function () {
    'use strict';

    angular
        .module('app')
        .directive('rating', rating);

    rating.$inject = [];

    function rating() {
        return {
            restrict: 'E',
            templateUrl: 'app/directives/db/novel-detail/rating/rating.html',
            link: function (scope, elm, attr, ) {
                angular.element(document).ready(() => {
                    let data = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

                    let x = d3.scaleLinear()
                        .domain([0, d3.max(data)])
                        .range([40, 200]);

                    d3.select('#ratingGraph')
                        .selectAll('div')
                            .data(data)
                        .enter().append('div')
                            .attr('class', 'bar')
                            .style('width', function (d) { return x(d) + 'px' })
                            .style('background-color', 'black')
                            .style('color', 'white')
                            .text(function (d) { return d });
                });
            }
        };
    }
})();
