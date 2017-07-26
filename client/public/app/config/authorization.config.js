(function () {
    'use strict';

    angular
        .module('app')
        .run(stateHandler);

    stateHandler.$inject = ['$rootScope', 'Auth', 'PageTitle'];

    function stateHandler($rootScope, Auth, PageTitle) {
        $rootScope.$on('$stateChangeStart', (event, toState, toStateParams, fromState, fromStateParams) => {
            $rootScope.event = event;
            $rootScope.toState = toState;
            $rootScope.toStateParams = toStateParams;
            $rootScope.fromState = fromState;
            $rootScope.fromStateParams = fromStateParams;

            Auth.authorize();
        });

        $rootScope.$on('$stateChangeSuccess', (event, toState) => {
            if (toState.data && toState.data.pageTitle) {
                PageTitle.set(toState.data.pageTitle);
            }
        });
    }
})();
