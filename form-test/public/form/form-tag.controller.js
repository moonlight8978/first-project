(function () {
    'use strict';

    angular
        .module('app')
        .controller('FormTagController', FormTagController);

    FormTagController.$inject = ['$resource', '$state', 'novel'];

    function FormTagController($resource, $state, novel) {
        let self = this;

        let url = 'http://localhost:3000/api/db/novels/:novelId/tags/:id';
        let mainUrl = 'http://localhost:3000/api/db/novel_tags/:id';

        let svc = function svc(url) {
            return $resource(url, {}, { 'update': { 'method': 'PUT' } });
        };

        this.novel = novel;
        getTags();

        setTimeout(() => {
            console.log(this.tags);
        }, 3000);

        this.submit = submit;
        this.update = update;
        this.del = del;
        this.submitT = submitT;
        this.delT = delT;

        async function getTags() {
            try {
                let tags = await svc(mainUrl)
                    .query({ page: 1, perPage: 12 })
                    .$promise;
                self.tags = tags;
            } catch (e) {
                console.log(e);
            }
        }

        async function submit(tag) {
            try {
                let message = await svc(mainUrl)
                    .save({}, tag)
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function del(tId) {
            try {
                let message = await svc(mainUrl)
                    .delete({ id: tId })
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function update(tId, tag) {
            try {
                let message = await svc(mainUrl)
                    .update({ id: tId }, tag)
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function submitT(tId) {
            try {
                let message = await svc(url)
                    .save({ novelId: self.novel.id, id: tId }, {})
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }

        async function delT(tId) {
            try {
                let message = await svc(url)
                    .delete({ novelId: self.novel.id, id: tId }, {})
                    .$promise;
                console.log(message);
            } catch (e) {
                console.log(e);
            }
        }
    }
})();
