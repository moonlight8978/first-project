(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelTag.list', {
            url: '?page',
            params: {
                'page': '1'
            },
            data: {
                'pageTitle': '全てのタグ'
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel-tag/list/novel-tag-list.html',
                    controller: 'NovelTagListController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                'data': ($q, $stateParams, TagResource) => {
                    let deferred = $q.defer();

                    TagResource.tag.query(
                        { page: $stateParams.page },
                        (data, headers) => {
                            let resolveData = {
                                'tags': data,
                                'totalTags': headers('x-total'),
                                'perPage': headers('x-per-page'),
                                'currentPage': headers('x-page')
                            };

                            deferred.resolve(resolveData);
                        },
                        (error) => {
                            deferred.reject(error);
                        });

                    return deferred.promise;
                }
            }
        });
    }
})();
