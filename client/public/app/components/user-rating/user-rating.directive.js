(function () {
    'use strict';

    angular
        .module('app')
        .directive('userRating', userRating);

    function userRating() {
        return {
            restrict: 'A',
            scope: {
                id: '=',
                type: '@'
            },
            templateUrl: 'app/components/user-rating/user-rating.html',
            controller: controller,
            controllerAs: 'vm',
            bindToController: true,
        };
    }
    
    controller.$inject = ['$scope', 'Principal', 'NovelResource'];
    
    function controller($scope, Principal, NovelResource) {
        const vm = this;
        
        vm.selections = [
            { star: 1, label: 'Appalling' },
            { star: 2, label: 'Horrible' },
            { star: 3, label: 'Very bad' },
            { star: 4, label: 'Bad' },
            { star: 5, label: 'Average' },
            { star: 6, label: 'Fine' },
            { star: 7, label: 'Good' },
            { star: 8, label: 'Very good' },
            { star: 9, label: 'Great' },
            { star: 10, label: 'Masterpiece' }
        ];

        vm.userSelection = {};

        vm.updateScore = updateScore;

        $scope.$watch(() => {
            return Principal.isAuthenticated();
        }, async (value) => {
            if (value) {
                console.log('getScore');
                await getScore();
            } else {
                console.log('setDefault');
                setDefault();
            }
        });

        async function getScore() {
            try {
                let rating = await NovelResource.rating
                    .get({ novelId: vm.id, userId: Principal.getUser().id })
                    .$promise;
                console.log(rating);
                vm.userSelection.star = rating.star;
                console.log(vm.userSelection.star);
                console.log('Done');
            } catch (e) {
                console.log(e);
                vm.errors = e;
            }
        }

        function setDefault() {
            vm.userSelection.star = '';
        }

        async function updateScore(star) {
            console.log('update');
            if (Principal.isAuthenticated()) {
                console.log('update');
                try {
                    console.log('Try');
                    let rating = await NovelResource.rating
                        .save(
                            { novelId: vm.id },
                            { 'star': star }
                        )
                        .$promise;
                    console.log(rating);
                    vm.userSelection.star = rating.star;
                    $scope.$emit('updateRating');
                } catch (e) {
                    console.log(e);
                    vm.errors = e.data;
                }
            } else {
                vm.errors = {
                    message: 'You need to log in!'
                };
            }
        }
    }
})();
