(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('novelTag.detail', {
            url: '/{id:int}',
            data: {
            },
            views: {
                'content@': {
                    templateUrl: 'app/db/novel/novel-tag/detail/novel-tag-detail.html',
                    controller: 'NovelTagDetailController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                'tag': async ($q, $stateParams, TagResource) => {
                    let tag = await TagResource.tag.get({ id: $stateParams.id })
                        .$promise;
                    return tag
                },
                'novels': ($q, $stateParams, TagResource) => {
                    let deferred = $q.defer();

                    TagResource.novel.query(
                        { id: $stateParams.id },
                        (novels, headers) => {
                            let data = {
                                'novels': novels,
                                'total': headers('x-total'),
                                'perPage': headers('x-per-page'),
                                'page': headers('x-page')
                            };

                            data.totalPage = Math.ceil(data.total / data.perPage);

                            deferred.resolve(data);
                        },
                        (error) => {
                            deffered.reject(error.data);
                        }
                    );

                    return deferred.promise;
                }
            }
        });
    }
})();
