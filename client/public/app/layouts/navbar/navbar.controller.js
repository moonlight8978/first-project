(function () {
    'use strict';

    angular
        .module('app')
        .controller('NavbarController', NavbarController);

    NavbarController.$inject = ['$state'];

    function NavbarController($state) {
        this.search = {
            'category': '',
            'query': ''
        };
        this.goSearch = goSearch;

        function goSearch() {
            if (this.search.category == 'novel')
                $state.go('search.novel', { q: this.search.query });
        }
    }
})();
