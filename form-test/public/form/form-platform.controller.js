(function () {
    'use strict';

    angular
        .module('app')
        .controller('FormPlatformController', FormPlatformController);

    FormPlatformController.$inject = ['$resource', '$state', 'novel'];

    function FormPlatformController($resource, $state, novel) {
        let self = this;
        let platformUrl = 'http://localhost:3000/api/db/novel_platforms/:id';

        let svc = function svc(url) {
            return $resource(url, {}, { 'update': { 'method': 'PUT' } });
        };

        this.novel = novel;
        this.submit = submit;
        this.update = update;
        this.del = del;

        getData();

        async function getData() {
            try {
                let platforms = await svc(platformUrl)
                    .query()
                    .$promise;
                self.platforms = platforms;
            } catch (e) {
                console.log(e);
            }
        }

        async function submit(platform) {
            try {
                let message = await svc(platformUrl)
                    .save({}, platform)
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function update(platformId, platform) {
            try {
                let message = await svc(platformUrl)
                    .update({ id: platformId }, platform)
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function del(platformId) {
            try {
                let message = await svc(platformUrl)
                    .delete({ id: platformId }, {})
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }
    }
})();
