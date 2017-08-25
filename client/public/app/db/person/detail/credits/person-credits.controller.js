(function () {
    'use strict';

    angular
        .module('app')
        .controller('PersonCreditsController', PersonCreditsController);

    PersonCreditsController.$inject = ['$scope', '$timeout', 'PersonResource'];
    
    function PersonCreditsController($scope, $timeout, PersonResource) {
        const vm = this;
        
        vm.voiceActresses = {
            page: 1,
            perPage: 10,
            loading: true,
            pageChange: voiceActressesPageChange
        };
        vm.staffs = {
            page: 1,
            perPage: 10,
            loading: true,
            pageChange: staffPageChange
        };
        
        $scope.$watch(() => vm.personId, (value) => {
            if (value) {
                getVaData();
                getStaffData();
            }
        });
        // Voice actress
        function getVaData() {
            PersonResource.voiceActress.query({ 
                id: vm.personId, 
                page: vm.voiceActresses.page, 
                perPage: vm.voiceActresses.perPage,
            }, (voiceActresses, headers) => {
                vm.voiceActresses.data = voiceActresses;
                vm.voiceActresses.total = headers('x-total');
                vm.voiceActresses.loading = false;
            }, (error) => {
                vm.voiceActresses.loading = false;
                console.log(error);
            });
        }
        
        // Staff
        function getStaffData() {
            PersonResource.staff.query({ 
                id: vm.personId, 
                page: vm.staffs.page, 
                perPage: vm.staffs.perPage, 
            }, (staffs, headers) => {
                vm.staffs.data = staffs;
                vm.staffs.total = headers('x-total');
                vm.staffs.loading = false;
            }, (error) => {
                vm.staffs.loading = false;
                console.log(error);
            });
        }
        
        function voiceActressesPageChange() {
            getVaData();
        }
        
        function staffPageChange() {
            getStaffData();
        }
    }
})();
