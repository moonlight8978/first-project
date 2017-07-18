(function () {
    'use strict';

    angular
        .module('app')
        .controller('FormScreenshotController', FormScreenshotController);

    FormScreenshotController.$inject = ['$resource', '$state', 'novel'];

    function FormScreenshotController($resource, $state, novel) {
        this.novel = novel;

        this.submit = submit;
        this.update = update;
        this.del = del;

        let url = 'http://localhost:3000/api/db/novels/:novelId/screenshots/:id';
        let urlSS = 'http://localhost:3000/api/db/screenshots/:id';

        let svc = function svc(url) {
            return $resource(url, {}, { 'update': { 'method': 'PUT' } });
        };

        async function submit(nId, ss) {
            try {
                let message = await svc(url)
                    .save({ novelId: nId }, ss)
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function del(ssId) {
            try {
                let message = await svc(urlSS)
                    .delete({ id: ssId })
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function update(ssId, ss) {
            try {
                let message = await svc(urlSS)
                    .update({ id: ssId }, ss)
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }
    }
})();
