(function () {
    'use strict';

    angular
        .module('app')
        .controller('EditVaController', EditVaController);

    EditVaController.$inject = ['$rootScope', 'CharacterResource'];

    function EditVaController($rootScope, CharacterResource) {
        let vm = this;
        console.log(vm.voiceActresses);

        vm.destroy = destroy;
        vm.submitUpdate = submitUpdate;

        $rootScope.$on('vaAdded', handler);

        async function destroy(i, va) {
            reset();

            console.log(va)

            try {
                await CharacterResource.va
                    .delete({ characterNovelId: 1, id: va.id }, {})
                    .$promise;

                vm.message = { x: '成功でした。' }
                vm.voiceActresses.splice(i, 1);
            } catch (e) {
                vm.error = e.data;
                console.log(e);
            }
        }

        function submitUpdate(i, va) {

        }

        function handler(event, va) {
            vm.voiceActresses.push(va);
            console.log(vm.voiceActresses)
        }

        function reset() {
            delete vm.message;
            delete vm.error;
        }
    }
})();
