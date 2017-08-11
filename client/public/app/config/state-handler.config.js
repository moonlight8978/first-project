(function () {
    'use strict';

    angular
        .module('app')
        .run(stateHandler);

    stateHandler.$inject = ['$rootScope', '$state', 'Auth', 'Principal', 'PageTitle'];

    function stateHandler($rootScope, $state, Auth, Principal, PageTitle) {
        $rootScope.$on('$stateChangeStart', (event, toState, toStateParams, fromState, fromStateParams) => {
            $rootScope.event = event;
            $rootScope.toState = toState;
            $rootScope.toStateParams = toStateParams;
            $rootScope.fromState = fromState;
            $rootScope.fromStateParams = fromStateParams;

            Principal.authenticate();
            Auth.checkExpiration();
            Auth.authorize();
        });

        $rootScope.$on('$stateChangeError', (event, toState, toParams, fromState, fromParams, error) => {
            if (error && error.status) {
                console.log(error);
                event.preventDefault();
                $state.go(`errors.${error.status}`)
            }
        });

        $rootScope.$on('$stateChangeSuccess', (event, toState) => {
            if (toState.data && toState.data.pageTitle) {
                PageTitle.set(toState.data.pageTitle);
            }
        });
    }
})();
