(function () {
    'use strict';

    angular
        .module('app')
        .directive('staffInNovel', staffInNovel);

    function staffInNovel() {
        return {
            restrict: 'E',
            scope: {
              staffs: '=',
              type: '@'
            },
            templateUrl: 'app/directives/db/novel-detail/staff/staff-in-novel.html',
            controller: function ($scope) {
                this.staffs = $scope.staffs;
                this.type = $scope.type;
            },
            controllerAs: 'vm'
        };
    }
})();
