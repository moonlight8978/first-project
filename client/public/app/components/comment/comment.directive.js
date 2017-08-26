(function () {
    'use strict';

    angular
        .module('app')
        .directive('comment', comment);

    comment.$inject = [];

    function comment() {
        const directive =  {
            restrict: 'A',
            scope: {
                'comment': '='
            },
            templateUrl: 'app/components/comment/comment.html',
            controller: 'CommentController',
            controllerAs: 'vm',
            bindToController: true,
            link: link
        };
        
        return directive;
        
        function link() {
            
        }
    }
})();
