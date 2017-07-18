(function () {
    'use strict';

    angular
        .module('app')
        .controller('FormStaffController', FormStaffController);

    FormStaffController.$inject = ['$resource', '$state', 'novel'];

    function FormStaffController($resource, $state, novel) {
        let self = this;

        this.novel = novel;

        this.submit = submit;
        this.update = update;
        this.del = del;

        this.positions = [
            { 'position': 'artist', 'label': 'Artist' },
            { 'position': 'composer', 'label': 'Composer' },
            { 'position': 'staff', 'label': 'Staff' },
            { 'position': 'vocals', 'label': 'Vocals' },
            { 'position': 'scenario', 'label': 'Scenario' }
        ];

        let novelStaffUrl = 'http://localhost:3000/api/db/novels/:novelId/staffs/:id';
        let staffUrl = 'http://localhost:3000/api/db/novel_staffs/:id';

        let svc = function svc(url) {
            return $resource(url, {}, { 'update': { 'method': 'PUT' } });
        };

        async function submit(staff) {
            try {
                let message = await svc(novelStaffUrl)
                    .save({ novelId: self.novel.id }, staff)
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function del(staffId) {
            try {
                let message = await svc(staffUrl)
                    .delete({ id: staffId })
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function update(staffId, staff) {
            try {
                let message = await svc(staffUrl)
                    .update({ id: staffId }, staff)
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }
    }
})();
