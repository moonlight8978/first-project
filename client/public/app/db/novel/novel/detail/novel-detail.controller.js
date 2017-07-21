(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailController', NovelDetailController);

    NovelDetailController.$inject = ['$http', '$stateParams', 'novel', 'reviews', 'votes', 'LENGTH'];

    function NovelDetailController($http, $stateParams, novel, reviews, votes, length) {
        let self = this;

        this.novel = novel;
        this.hideNsfw = true;
        this.novel.reviews = reviews.data;
        // this.novel.votes = votes.data;

        this.threeSizes = threeSizes;
        this.birthday = birthday;

        this.hideNsfw = true;
        this.length = length.full;

        function threeSizes(character) {
            return `${character.bust || '?'}-${character.waist || '?'}-${character.hips || '?'}`;
        }

        function birthday(character) {
            return `${character.birthdayMonth || '?'}月` +
                   `${character.birthdayDay || '?'}日`;
        }
    }
})();
