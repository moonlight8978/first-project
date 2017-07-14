(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailController', NovelDetailController);

    NovelDetailController.$inject = ['NovelResource', '$stateParams', 'LENGTH'];

    function NovelDetailController(NovelResource, $stateParams, length) {
        this.id = $stateParams.id;
        this.hideNsfw = true;
        this.length = length.full
        this.req = {
            'character': {},
            'release': {},
            'staff': {}
        }

        this.submit = submit;

        // AJAX request to get informations about novel
        NovelResource.novel.get({ id: this.id, fullInfo: 1 }, (novel) => {
            this.novel = novel;
        });

        function submit() {
            this.req.character.birthdayDay = this.req.character.birthday.getDate();
            this.req.character.birthdayMonth = this.req.character.birthday.getMonth() + 1;
            console.log(this.req.character)
            NovelResource.character.save({ novelId: this.id }, this.req.character, (message) => {
                console.log(message);
            });
        }
    }
})();
