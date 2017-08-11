(function () {
    'use strict';

    angular
        .module('app')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider.state('errors.not-allow-member', {
            url: '/not_allow_member',
            data: {
                pageTitle: 'メンバーは禁止'
            },
            views: {
                'content@': {
                    templateUrl: 'app/errors/not-allow-member/not-allow-member.html'
                }
            }
        });
    }
})();
