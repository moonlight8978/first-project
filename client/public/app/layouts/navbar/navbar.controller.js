(function () {
    'use strict';

    angular
        .module('app')
        .controller('NavbarController', NavbarController);

    NavbarController.$inject = ['$scope', '$state', 'NovelResource'];

    function NavbarController($scope, $state, NovelResource) {
        this.search = {
            'category': '',
            'query': '',
            'results': []
        };

        this.goSearch = goSearch;
        this.search = search;
        this.clearInput = clearInput;

        // $scope.$watch(() => {
        //     return this.search.query;
        // }, async (newValue, oldValue) => {
        //     if (!newValue)
        //         this.search.results = [];
        //     else if (newValue !== oldValue)
        //         this.search.results = await liveSearch(this.search.query);
        // });

        this.user = {
            'name': '鈴木ひろし',
            'profileImage': '/assets/img/vanilla.png'
        };

        function goSearch() {
            if (this.search.category == 'novel')
                $state.go('search.novel', { q: this.search.query });
        }

        function clearInput() {
            this.search.query = '';
            this.search.results = [];
        }

        async function search() {
            if (!this.search.query || !this.search.query.trim() || !this.search.category) {
                this.search.results = [];
            } else {
                this.search.results = await liveSearch(this.search.query, this.search.category);
            }
        }

        async function liveSearch(query, category) {
            let results
            switch (category) {
                case 'novel': {
                    results = await NovelResource.search
                        .query({ q: query, perPage: 6, page: 1 })
                        .$promise }
            }
            return results;
        }
    }
})();
