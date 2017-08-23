(function () {
    'use strict';

    angular
        .module('app')
        .directive('creditStat', creditStat);

    function creditStat() {
        return {
            restrict: 'E',
            scope: {
                'vaData': '=',
                'staffData': '='
            },
            templateUrl: 'app/db/person/detail/credit-stat/credit-stat.html',
            link: link
        };

        function link(scope, element) {
            scope.drawing = true;
            scope.noData = false;
            
            if (scope.vaData || scope.staffData) {
                const parseTime = d3.timeParse('%Y');
                const $element = $(element);
                const margin = {
                    'top': 15,
                    'right': 30,
                    'bottom': 30,
                    'left': 15,
                };
                
                if (scope.vaData && scope.vaData.length == 1) {
                    scope.vaData.unshift({
                        year: (parseInt(scope.vaData[0].year) - 1).toString(),
                        total: 0,
                    });
                    
                }
                
                if (scope.staffData && scope.staffData.length == 1) {
                    scope.staffData.unshift({
                        year: (parseInt(scope.staffData[0].year) - 1).toString(),
                        total: 0,
                    });
                }
                
                if (!scope.vaData) {
                    scope.vaData = [];
                    scope.vaData[0] = { 
                        year: scope.staffData[0].year,
                        total: 0
                    };
                }
                
                if (!scope.staffData) {
                    scope.staffData = [];
                    scope.staffData[0] = { 
                        year: scope.vaData[0].year,
                        total: 0
                    };
                }
                
                const va = scope.vaData.map((va) => {
                    return { 
                        year: parseTime(va.year), 
                        total: va.total 
                    };
                });
                
                const staff = scope.staffData.map((staff) => {
                    return { 
                        year: parseTime(staff.year), 
                        total: staff.total 
                    };
                });
                
                let width;
                const height = 300 - margin.top - margin.bottom;
                let xScale;
                let yScale = d3.scaleLinear().range([height, 0]);
                let xAxis, yAxis;
                let line;
                let wrap = d3.select('#creditStatChart')
                    .attr('height', height + margin.top + margin.bottom);
                let chart;
                
                const xTicks = d3.max([
                    d3.max(scope.vaData.map(va => parseInt(va.year))), 
                    d3.max(scope.staffData.map(staff => parseInt(staff.year)))
                ]) - d3.min([
                    d3.min(scope.vaData.map(va => parseInt(va.year))),
                    d3.min(scope.staffData.map(staff => parseInt(staff.year)))
                ]);
                const yTicks = d3.max([
                    d3.max(scope.vaData.map(va => va.total)), 
                    d3.max(scope.staffData.map(staff => staff.total))
                ]) - d3.min([
                    d3.min(scope.vaData.map(va => va.total)),
                    d3.min(scope.staffData.map(staff => staff.total))
                ]);
                
                (function init() {
                    getDimensions();
                    getScale();
                    draw();
                    scope.drawing = false;
                })();
                
                $(window).resize(redraw);
                
                function redraw() {
                    destroy();
                    getDimensions();
                    getScale();
                    draw();
                }
                
                function getDimensions() {
                    width = $element.width() - margin.left - margin.right;
                    chart = wrap.attr('width', width + margin.left + margin.right)
                        .append('g')
                            .attr('transform', `translate(${margin.left}, ${margin.top})`);;
                }
                
                function getScale() {
                    xScale = d3.scaleTime()
                        .range([0, width])
                        .domain([
                            d3.min([
                                d3.min(va, (va) => va.year),
                                d3.min(staff, (staff) => staff.year)
                            ]),
                            d3.max([
                                d3.max(va, (va) => va.year),
                                d3.max(staff, (staff) => staff.year)
                            ])
                        ]);
                    yScale = yScale
                        .domain([0, d3.max([
                            d3.max(va.map((va) => va.total)),
                            d3.max(staff.map((staff) => staff.total))
                        ])]);
                }
                
                function destroy() {
                    wrap.selectAll('*').remove();
                }
                
                function draw() {
                    line = d3.line()
                        .x((d, i) => xScale(d.year))
                        .y((d, i) => yScale(d.total))
                        .curve(d3.curveMonotoneX);
                        
                    xAxis = d3.axisBottom(xScale)
                        .ticks(xTicks)
                        .tickFormat(d3.timeFormat('%Y'));
                    yAxis = d3.axisLeft(yScale)
                        .ticks(yTicks)
                        .tickFormat(d3.format(',.0f'));
                        
                    chart.append('g')
                        .attr('transform', `translate(0, ${height + 2})`)
                        .call(xAxis);
                        
                    chart.append('g')
                        .attr('transform', `translate(-1, 0)`)
                        .call(yAxis);
                    drawVaLine();
                    drawStaffLine();
                }
                
                function drawVaLine() {
                    chart.append('path')
                        .datum(va)
                        .attr('class', 'chart-line va-line')
                        .attr('d', line);
                }
                
                function drawStaffLine() {
                    chart.append('path')
                        .datum(staff)
                        .attr('transfrom', 'translate(0, -1)')
                        .attr('class', 'chart-line staff-line')
                        .attr('d', line);
                }
                
                scope.$on('$destroy', () => {
                    $(window).off('resize', redraw);
                });
            } else {
                scope.noData = true;
                scope.drawing = false;
            }
        }
    }
})();
