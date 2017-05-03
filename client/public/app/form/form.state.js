function formState($stateProvider) {
    $stateProvider.state('form', {
        parent: 'app',
        url: '/form',
        views: {
            'content@': {
                templateUrl: 'app/form/form.html',
                controller: 'FormController',
                controllerAs: 'vm'
            }
        }
    });
}

formState.$inject = ['$stateProvider'];

export default formState;