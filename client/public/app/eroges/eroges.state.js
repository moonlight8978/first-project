erogesState.$inject = ['$stateProvider'];

export function erogesState($stateProvider) {
    $stateProvider.state('eroges', {
        parent: 'app',
        url: '/eroges',
        views: {
            'content@': {
                templateUrl: 'app/eroges/eroges.html',
                controller: 'ErogesController',
                controllerAs: 'vm'
            }
        }
    });
}