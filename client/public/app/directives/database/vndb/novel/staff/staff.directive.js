(function () {
    'use strict';

    angular
        .module('app')
        .directive('novelStaff', novelStaff);

    function novelStaff() {
        return {
            restrict: 'E',
            scope: {
              staffs: '=',
              type:   '='
            },
            templateUrl: 'app/directives/database/vndb/novel/staff/staff.html'
        };
    }
})();
