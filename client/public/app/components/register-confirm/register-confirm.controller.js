(function () {
    'use strict';

    angular
        .module('app')
        .controller('RegisterConfirmController', RegisterConfirmController);

    RegisterConfirmController.$inject = ['$stateParams', '$timeout', '$state', '$http', 'Auth'];

    function RegisterConfirmController($stateParams, $timeout, $state, $http, Auth) {
        let self = this;
        self.complete = false;
        console.log($stateParams.email)
        console.log($stateParams.token)

        let data = {
            'email': $stateParams.email,
            'token': $stateParams.token
        }

        $timeout(() => {
            $http.post('http://localhost:3000/api/register/confirm', data)
                .then((data) => {
                    self.complete = true;
                }, (e) => {
                    self.error = e.data;
                });
        }, 1500);
    }
})();
