(function () {
    'use strict';

    angular
        .module('app')
        .controller('TagInNovelController', TagInNovelController);

    TagInNovelController.$inject = ['TagModal']

    function TagInNovelController(TagModal) {
        let vm = this;

        vm.open = open;

        function open() {
            TagModal.open('lg', vm.novel);
        }
    }
})();
