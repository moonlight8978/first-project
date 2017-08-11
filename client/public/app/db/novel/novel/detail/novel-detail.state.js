(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.detail', {
            url: '/{id:int}',
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/detail/novel-detail.html',
                    controller: 'NovelDetailController',
                    controllerAs: 'vm'
                }
            },
            data: {
                roles: []
            },
            resolve: {
                novel: function ($stateParams, NovelResource) {
                    return NovelResource.novel
                        .get({ id: $stateParams.id, fullInfo: 1 })
                        .$promise;
                },
                reviews: function ($http) {
                    return $http.get('reviews.json');
                },
                votes: function ($http) {
                    return $http.get('votes.json');
                }
            }
        });
    }
})();
