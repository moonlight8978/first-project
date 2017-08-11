(function () {
    'use strict';

    angular
        .module('app')
        .directive('userRating', userRating);

    userRating.$inject = ['Principal', 'NovelResource'];

    function userRating(Principal, NovelResource) {
        return {
            restrict: 'A',
            scope: {
                'novel': '=',
                'type': '@'
            },
            templateUrl: 'app/components/rating/your-rating.html',
            link: function (scope, elm, attr) {
                scope.selections = [
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

                scope.userSelection = {};

                scope.updateScore = updateScore;

                scope.$watch(() => {
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
                            .get({ novelId: scope.novel, userId: Principal.getUser().id })
                            .$promise;
                        console.log(rating);
                        scope.userSelection.star = rating.star;
                        console.log(scope.userSelection.star);
                        console.log('Done');
                    } catch (e) {
                        console.log(e);
                        scope.errors = e;
                    }
                }

                function setDefault() {
                    scope.userSelection.star = '';
                }

                async function updateScore(star) {
                    console.log('update');
                    if (Principal.isAuthenticated()) {
                        console.log('update');
                        try {
                            console.log('Try');
                            let rating = await NovelResource.rating
                                .save(
                                    { novelId: scope.novel },
                                    { 'star': star }
                                )
                                .$promise;
                            console.log(rating);
                            scope.userSelection.star = rating.star;
                            scope.$emit('updateRating');
                        } catch (e) {
                            console.log(e);
                            scope.errors = e.data;
                        }
                    } else {
                        scope.errors = {
                            message: 'You need to log in!'
                        };
                    }
                }
            }
        };
    }
})();
