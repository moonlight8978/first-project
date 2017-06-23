(function () {
    'use strict';

    angular
        .module('app')
        .controller('HomeController', HomeController);

    HomeController.$inject = ['NovelResource', '$state', 'LENGTH'];

    function HomeController(NovelResource, $state, length) {
        this.length = length;
        this.query = '';

        this.search = search;

        function search(query) {
            $state.go('novelSearch', { q: this.query });
        }
    }
})();
