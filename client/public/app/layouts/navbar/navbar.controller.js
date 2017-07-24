(function () {
    'use strict';

    angular
        .module('app')
        .controller('NavbarController', NavbarController);

    NavbarController.$inject = ['$scope', '$state', 'NovelResource'];

    function NavbarController($scope, $state, NovelResource) {
        let self = this;

        this.search = {
            'category': '',
            'query': '',
            'results': []
        };

        // this.user = {
        //     'name': '鈴木ひろし',
        //     'profileImage': '/assets/img/vanilla.png'
        // };

        this.goSearch = goSearch;
        this.search = search;
        this.clearInput = clearInput;

        function goSearch() {
            if (self.search.category == 'novel') {
                $state.go('search.novel', { q: self.search.query });
            }
        }

        function clearInput() {
            self.search.query = '';
            self.search.results = [];
        }

        async function search() {
            if (!self.search.query || !self.search.query.trim() || !self.search.category) {
                self.search.results = [];
            } else {
                self.search.results = await liveSearch(self.search.query, self.search.category);
            }
        }

        async function liveSearch(query, category) {
            let results;
            switch (category) {
                case 'novel': {
                    results = await NovelResource.search
                        .query({ q: query, perPage: 6, page: 1 })
                        .$promise;
                }
            }
            return results;
        }
    }
})();
