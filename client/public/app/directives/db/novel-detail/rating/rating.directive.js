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
            link: link
        };

        function link(scope, elm, attr) {
            angular.element(document).ready(() => {
                const margin = {
                    'top': 15,
                    'bottom': 25,
                    'left': 10,
                    'right': 10
                };
                const width = 230 - margin.left - margin.right;
                const height = 250 - margin.top - margin.bottom;

                let chart = d3.select('#ratingGraph')
                    .attr('width', width + margin.left + margin.right)
                    .attr('height', height + margin.top + margin.bottom)
                    .append('g')
                        .attr('transform', `translate(${margin.left}, ${margin.top})`);

                let y = d3.scaleLinear()
                    .range([height, 0]);

                let x = d3.scaleBand()
                    .range([0, width])
                    .padding(0.1);

                chart.append('g')
                    .attr('class', 'axis-x')
                    .attr('transform', `translate(0, ${height + 3})`);

                let t = d3.transition()
                    .duration(750);

                function draw(data) {
                    y.domain([0, d3.max(data.map((d) => {
                        return d.count;
                    }))]);

                    x.domain(data.map((d) => {
                        return d.star;
                    }));

                    chart.select('.axis-x')
                        .call(d3.axisBottom(x));

                    chart.selectAll('.bar')
                        .attr('class', 'old')
                        .transition(t)
                            .style('opacity', 0)
                        .remove();

                    let bars = chart.selectAll('.bar')
                        .data(data)
                        .enter().append('g')
                            .attr('class', 'bar');
                    bars.append('rect')
                        .style('opacity', 0)
                        .attr('x', (d) => x(d.star))
                        .attr('width', x.bandwidth())
                        .attr('y', (d) => {
                            return y(d.count);
                        })
                        .attr('height', (d) => {
                            return height - y(d.count);
                        })
                        .transition(t)
                            .style('opacity', 1);

                    bars.append('text')
                        .attr('x', (d) => {
                            return x(d.star) + 9;
                        })
                        .attr('y', (d) => {
                            return y(d.count) - 3;
                        })
                        .text((d) => d.count);
                }

                draw(scope.data);

                scope.$on('updateGraph', (event, data) => {
                    console.log(data);
                    draw(data);
                });
            });
        }
    }
})();
