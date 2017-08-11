(function () {
    'use strict';

    angular
        .module('app')
        .controller('EditVaController', EditVaController);

    EditVaController.$inject = ['$rootScope', 'CharacterResource', 'DeleteConfirm'];

    function EditVaController($rootScope, CharacterResource, DeleteConfirm) {
        let vm = this;
        console.log(vm.voiceActresses);

        vm.destroy = destroy;
        vm.submitUpdate = submitUpdate;

        $rootScope.$on('vaAdded', handler);

        function destroy(i, va) {
            DeleteConfirm.open(
                'DeleteVaController',
                'app/db/novel/novel/detail/character/edit/delete-va/delete-va.html',
                { i: i,
                  va: va,
                  voiceActresses: vm.voiceActresses }
            );
        }

        async function submitUpdate(i, oldVa, va) {
            console.log(oldVa);

            try {
                let resVa = await CharacterResource.va
                    .update({ characterNovelId: 1, id: oldVa.id }, va)
                    .$promise;
                edit(i, resVa);
                vm.message = { x: '成功でした！' };

            } catch (e) {
                vm.error = e.data;
                console.log(e);
            }
        }

        function handler(event, va) {
            vm.voiceActresses.push(va);
            console.log(vm.voiceActresses)
        }

        function edit(i, va) {
            vm.voiceActresses[i] = va;
        }
    }
})();
