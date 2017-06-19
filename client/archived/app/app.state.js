function appState($stateProvider, $urlRouterProvider, $locationProvider) {
    $stateProvider.state('app', {
        url: '',
        views: {

        }
    });

    // $locationProvider.html5Mode({
    //     enabled: true,
    //     requireBase: false
    // });
    $locationProvider.hashPrefix('');
    $urlRouterProvider.otherwise('/');
};

appState.$inject = ['$stateProvider', '$urlRouterProvider', '$locationProvider'];

export default appState;
