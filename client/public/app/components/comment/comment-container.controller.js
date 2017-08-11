(function () {
    'use strict';

    angular
        .module('app')
        .controller('CommentContainerController', CommentContainerController);

    CommentContainerController.$inject = ['$scope'];

    function CommentContainerController($scope) {
        let vm = this;
        
        // Variables
        vm.currentPage = 1;
        vm.perPage = 6;
        
        // Functions
        vm.pageChange = pageChange;
        vm.renderComment = renderComment;
        
        // Init functions
        
        // Functions declare
        function pageChange() {
            // vm.viewComments = renderComment(vm.currentPage);
            $('html, body').animate({
                scrollTop: $('#commentTop').offset().top - 20
            }, 'slow');
        }
        
        function renderComment(page) {
            const start = (page - 1) * vm.perPage;
            const end = page * vm.perPage;
            
            return vm.comments.slice(start, end);
        }
    }
})();
