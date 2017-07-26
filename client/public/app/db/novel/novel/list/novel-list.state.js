(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novel.list', {
            url: '?length&sort&page',
            params: {
                length: null,
                sort: null,
                page: '1'
            },
            data: {
                pageTitle: 'ビジュアルノベル・リスト'
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel/list/novel-list.html',
                    controller: 'NovelListController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                data: ['$q', '$stateParams', 'NovelResource', function ($q, $stateParams, NovelResource) {
                    let deferred = $q.defer();

                    NovelResource.novel.query({
                        'perPage': 4,
                        'page': $stateParams.page,
                        'length[]': $stateParams.length
                    }, (novels, headers) => {
                        let data = {
                            'novels': novels,
                            'headers': headers()
                        };
                        deferred.resolve(data);
                    });

                    return deferred.promise;
                }]
            }
        });
    }
})();
