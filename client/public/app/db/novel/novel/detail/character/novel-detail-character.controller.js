(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelDetailCharacterController', NovelDetailCharacterController);

    NovelDetailCharacterController.$inject = ['DeleteConfirm'];

    function NovelDetailCharacterController(DeleteConfirm) {
        let vm = this;

        vm.threeSizes = threeSizes;
        vm.birthday = birthday;

        vm.destroy = destroy;

        function destroy(character) {
            console.log('Open delete');
            DeleteConfirm.open(
                'NovelDetailCharacterDeleteController',
                'app/db/novel/novel/detail/character/delete/novel-detail-character-delete.html',
                { 'character': character,
                  'novelId': vm.novel.id }
            );
        };

        function threeSizes(character) {
            return `${character.bust || '?'}-` +
                   `${character.waist || '?'}-` +
                   `${character.hips || '?'}`;
        }

        function birthday(character) {
            return `${character.birthdayMonth || '?'}月` +
                   `${character.birthdayDay || '?'}日`;
        }
    }
})();
