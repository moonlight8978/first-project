(function () {
    'use strict';

    angular
        .module('app')
        .controller('CommentController', CommentController);

    CommentController.$inject = [];

    function CommentController() {
        let vm = this;
    }
})();
