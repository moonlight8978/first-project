(function () {
    'use strict';

    angular
        .module('app')
        .controller('PersonCreditsController', PersonCreditsController);

    PersonCreditsController.$inject = ['PersonResource'];
    
    function PersonCreditsController(PersonResource) {
        const vm = this;
        
        vm.voiceActresses = {
            page: 1,
            perPage: 10,
        };
        vm.staffs = {
            page: 1,
            perPage: 10,
        };
        
        vm.pageChange = pageChange;
        
        getVaData();
        getStaffData();
        // Voice actress
        function getVaData() {
            PersonResource.voiceActress.query({ 
                id: vm.personId, 
                page: vm.voiceActresses.page, 
                perPage: vm.voiceActresses.perPage,
            }, (voiceActresses, headers) => {
                vm.voiceActresses.data = voiceActresses;
                vm.voiceActresses.total = headers('x-total');
            }, (error) => {
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
            }, (error) => {
                console.log(error);
            });
        }
        
        function pageChange() {
            
        }
    }
})();
