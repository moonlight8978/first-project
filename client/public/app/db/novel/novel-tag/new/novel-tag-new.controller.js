(function () {
    'use strict';

    angular
        .module('app')
        .controller('NovelTagNewController', NovelTagNewController);

    NovelTagNewController.$inject = ['TagResource', 'RemoveEmptyField'];

    function NovelTagNewController(TagResource, RemoveEmptyField) {
        let vm = this;
        const success = { 'message': 'Everythingは大丈夫！' };

        vm.submit = submit;

        async function submit(tag) {
            reset();
            RemoveEmptyField.perform(tag);

            try {
                let response = await TagResource.tag
                    .save({}, tag)
                    .$promise;
                vm.message = success;
                console.log(response);
            } catch (e) {
                vm.error = e.data;
                console.log(e);
            }
        }

        function reset() {
            delete vm.error;
            delete vm.message;
        }
    }
})();
