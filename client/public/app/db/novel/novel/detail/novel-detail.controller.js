(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailController', NovelDetailController);

    NovelDetailController.$inject = ['$http', '$stateParams', 'novel', 'reviews', 'votes', 'LENGTH', 'Principal', 'PageTitle'];

    function NovelDetailController($http, $stateParams, novel, reviews, votes, length, Principal, PageTitle) {
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
