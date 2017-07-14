(function () {
    'use strict';

    angular
        .module('app')
        .controller('FormController', FormController);

    FormController.$inject = ['$resource', 'char'];

    function FormController($resource, char) {
        this.character = {};

        this.req = {
          'character': {},
          'va': []
        };

        this.va = []

        this.update = update;
        this.submit = submit;
        this.submitVA = submitVA;
        this.updateVA = updateVA;

        let url = 'http://localhost:3000/api/db/characters/:id';
        let url_2 = 'http://localhost:3000/api/db/novels/:novel_id/characters/:id';
        let url_3 = 'http://localhost:3000/api/db/novels/:novel_id/characters/:character_id/voice_actresses/:id'

        this.character = char;
        console.log(this.character)

        function update() {
            $resource(url, {}, { 'update': { method: 'PUT' } }).update({ id: 1 }, this.req.character, (message) => {
                console.log(message)
            }, (message) => {
                console.log(message)
            });
        }

        function submit() {
            $resource(url_2).save({ novel_id: 2 }, this.req.character, (message) => {
                console.log(message)
            }, (message) => {
                console.log(message)
            });
        }

        function submitVA(va) {
            $resource(url_3).save({ novel_id: 2, character_id: 8, id: va.id }, va, (message) => {
                console.log(message)
            }, (message) => {
                console.log(message)
            })
        }

        function updateVA(n_id, c_id, va_id, va) {
            $resource(url_3, {}, { 'update': { method: 'PUT' } }).update({ novel_id: n_id, character_id: c_id, id: va_id }, va, (message) => {
                console.log(message)
            }, (message) => {
                console.log(message)
            })
        }

    }
})();
