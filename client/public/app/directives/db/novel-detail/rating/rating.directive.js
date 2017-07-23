(function () {
    'use strict';

    angular
        .module('app')
        .directive('rating', rating);

    rating.$inject = [];

    function rating() {
        return {
            restrict: 'E',
            scope: {
                'data': '='
            },
            templateUrl: 'app/directives/db/novel-detail/rating/rating.html',
            link: function (scope, elm, attr, ) {
                angular.element(document).ready(() => {
                    const margin = {
                        'top': 15,
                        'bottom': 25,
                        'left': 10,
                        'right': 10
                    };
                    const width = 230 - margin.left - margin.right;
                    const height = 250 - margin.top - margin.bottom;

                    let y = d3.scaleLinear()
                        .domain([0, d3.max(scope.data.map((d) => {
                            return d.count;
                        }))])
                        .range([height, 0]);

                    let x = d3.scaleBand()
                        .domain(scope.data.map((d) => {
                            return d.star;
                        }))
                        .range([0, width])
                        .padding(0.1);

                    let chart = d3.select('#ratingGraph')
                        .attr('width', width + margin.left + margin.right)
                        .attr('height', height + margin.top + margin.bottom)
                        .append('g')
                            .attr('transform', `translate(${margin.left}, ${margin.top})`);

                    chart.append('g')
                        .attr('class', 'axis-x')
                        .attr('transform', `translate(0, ${height + 3})`)
                        .call(d3.axisBottom(x));

                    let bar = chart.selectAll('.bar')
                        .data(scope.data)
                        .enter().append('g')
                            .attr('class', 'bar');

                    bar.append('rect')
                        .attr('x', (d) => {
                            return x(d.star);
                        })
                        .attr('y', (d) => {
                            return y(d.count);
                        })
                        .attr('height', (d) => {
                            return height - y(d.count);
                        })
                        .attr('width', x.bandwidth());

                    bar.append('text')
                        .attr('x', (d) => {
                            return x(d.star) + 9;
                        })
                        .attr('y', (d) => {
                            return y(d.count) - 3;
                        })
                        .text((d) => {
                            return d.count;
                        });
                    // let x = d3.scaleLinear()
                    //     .domain([0, d3.max(scope.data)])
                    //     .range([0, width]);

                    // let y = d3.scaleBand()
                    //     .domain(scope.data.map((d, i) => {
                    //         return i + 1;
                    //     }))
                    //     .range([0, height])
                    //     .padding(0.1);

                    // let chart = d3.select('#ratingGraph')
                    //     .attr('width', width + margin.left)
                    //     .attr('height', height);

                    // chart.selectAll('.bar')
                    //     .data(scope.data)
                    //     .enter().append('rect')
                    //         .attr('transform', `translate(${margin.left}, 0)`)
                    //         .attr('class', 'bar')
                    //         .attr('x', 0)
                    //         .attr('y', (d, i) => {
                    //             return y(i + 1);
                    //         })
                    //         .attr('height', y.bandwidth())
                    //         .attr('width', (d) => {
                    //             return x(d);
                    //         });

                    // chart.append('g')
                    //     .attr('transform', `translate(${margin.left}, 0)`)
                    //     .call(d3.axisLeft(y));

                    // bar.append('text')
                    //     .attr('x', (d) => {
                    //         return x(d) + 10;
                    //     })
                    //     .attr('y', barHeight / 2)
                    //     .attr('dy', '.35em')
                    //     .text((d) => {
                    //         return d;
                    //     });

                    // bar.append('text')
                    //     .attr('x', -3)
                    //     .attr('y', barHeight / 2)
                    //     .attr('dy', '.35em')
                    //     .text((d, i) => {
                    //         return i + 1;
                    //     });
                });
            }
        };
    }
})();
