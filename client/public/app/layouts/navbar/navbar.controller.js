(function () {
    'use strict';

    angular
        .module('app')
        .controller('NavbarController', NavbarController);

    NavbarController.$inject = ['$scope', '$state', 'NovelResource', 'Principal', 'Auth'];

    function NavbarController($scope, $state, NovelResource, Principal, Auth) {
        let self = this;

        this.search = {
            'category': '',
            'query': '',
            'results': []
        };

        self.isAuthenticated = Principal.isAuthenticated();
        self.user = Principal.getUser();

        this.goSearch = goSearch;
        this.search = search;
        this.clearInput = clearInput;
        self.logout = Auth.logout;

        $scope.$watch(() => {
            return Principal.isAuthenticated();
        }, (value) => {
            if (value) {
                self.isAuthenticated = Principal.isAuthenticated();
                self.user = Principal.getUser();
            } else {
                self.isAuthenticated = false;
                self.user = null;
            }
        });

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
