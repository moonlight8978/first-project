(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailController', NovelDetailController);

    NovelDetailController.$inject = ['$rootScope', '$scope', '$state', '$http', '$stateParams', 'novel', 'reviews', 'votes', 'LENGTH', 'Principal', 'PageTitle', 'NovelResource'];

    function NovelDetailController($rootScope, $scope, $state, $http, $stateParams, novel, reviews, votes, length, Principal, PageTitle, NovelResource) {
        // common
        let self = this;
        PageTitle.set(novel.title);

        // \/ for novel
        this.novel = novel;
        this.hideNsfw = true;
        // this.novel.votes = votes.data;

        this.threeSizes = threeSizes;
        this.birthday = birthday;

        this.hideNsfw = true;
        this.length = length.full;

        // \/ for reviews
        this.novel.reviews = reviews.data;
        this.reviewTotalPage = this.novel.reviews.length;
        this.reviewPage = 1;
        this.renderReviews = paginateReviews(this.reviewPage);

        this.reviewPageChange = reviewPageChange;

        // \/ event handlers
        $scope.$on('updateRating', async (event, data) => {
            // $state.reload();
            try {
                let newNovel = await NovelResource.novel
                    .get({ id: self.novel.id, fullInfo: 1 })
                    .$promise;
                self.novel.rating = newNovel.rating;
                self.novel.ratingsDetail = newNovel.ratingsDetail;
                self.novel.ratingsStatistics = newNovel.ratingsStatistics;
                $scope.$broadcast('updateGraph', self.novel.ratingsStatistics);
                console.log(newNovel);
            } catch (e) {
                console.log(e);
            }
        });

        $rootScope.$on('tagAdded', (event, tag) => {
            console.log(tag);
            self.novel.tags.push(tag);
            console.log(self.novel.tags);
        });

        // \/ functions

        function threeSizes(character) {
            return `${character.bust || '?'}-${character.waist || '?'}-${character.hips || '?'}`;
        }

        function birthday(character) {
            return `${character.birthdayMonth || '?'}月` +
                   `${character.birthdayDay || '?'}日`;
        }

        function reviewPageChange() {
            self.renderReviews = paginateReviews(self.reviewPage);
        }

        function paginateReviews(page) {
            let begin = (page - 1) * 5;
            let end = begin + 5 - 1;
            return self.novel.reviews.slice(begin, end);
        }
    }
})();
