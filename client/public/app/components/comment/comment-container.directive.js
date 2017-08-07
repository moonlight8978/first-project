(function () {
    'use strict';
    
    angular
        .module('app')
        .directive('commentContainer', commentContainer);
    
    function commentContainer() {
        const directive =  {
            restrict: 'E',
            scope: {
                comments: '=',
                done: '='
            },
            templateUrl: 'app/components/comment/comment-container.html',
            controller: 'CommentContainerController',
            controllerAs: 'vm',
            bindToController: true
        };
        
        return directive;
    }
})();
