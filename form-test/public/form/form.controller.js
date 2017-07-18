(function () {
    'use strict';

    angular
        .module('app')
        .controller('FormController', FormController);

    FormController.$inject = ['$resource', '$state', 'novel'];

    function FormController($resource, $state, novel) {
        // let url = 'http://localhost:3000/api/db/novel_releases/:id'
        // let url_2 = 'http://localhost:3000/api/db/novels/:novel_id/releases/:id'
        // let url_3 = 'http://localhost:3000/api/db/novel_platforms/:id'
        //
        this.novel = novel;


        //
        // this.req = {
        //     'release': {},
        //     'releases': []
        // }
        //
        // this.today = new Date()
        //
        // this.submit = submit
        // this.updateR = updateR
        // this.deleteR = deleteR
        // this.addR2N = addR2N
        //
        // $resource(url_3).query((platforms) => {
        //     this.platforms = platforms
        // })
        //
        // function submit(r) {
        //     r.released_unfix && fix_date(r)
        //     $resource(url_2)
        //         .save({ novel_id: this.novel.id }, r, (message) => {
        //             console.log(message)
        //         }, (message) => {
        //             console.log(message)
        //         })
        // }
        //
        // function updateR(r_id, r) {
        //     console.log(r)
        //     console.log(r.id)
        //     r.released_unfix && fix_date(r)
        //     $resource(url, {}, { 'update': { method: 'PUT' } })
        //         .update({ id: r_id }, r, (message) => {
        //             console.log(message)
        //         }, (message) => {
        //             console.log(message)
        //         })
        // }
        //
        // function deleteR(novel_id, release_id) {
        //     $resource(url_2)
        //         .delete({ novel_id: novel_id, id: release_id }, {}, (message) => {
        //             console.log(message)
        //         }, (message) => {
        //             console.log(message)
        //         })
        // }
        //
        // function addR2N(r_id) {
        //     $resource(url_2, {})
        //         .save({ novel_id: this.novel.id, id: r_id }, {}, (message) => {
        //             console.log(message)
        //         }, (message) => {
        //             console.log(message)
        //         })
        // }
        //
        // function fix_date(release) {
        //     release.released = `${release.released_unfix.getFullYear()}-` +
        //                        `${release.released_unfix.getMonth() + 1}-` +
        //                        `${release.released_unfix.getDate()}`
        // }
        //
        // function formatDate(date) {
        //     console.log(date)
        //
        //     var d = new Date(date),
        //         month = '' + (d.getMonth() + 1),
        //         day = '' + d.getDate(),
        //         year = d.getFullYear()
        //
        //     if (month.length < 2)
        //         month = '0' + month
        //     if (day.length < 2)
        //         day = '0' + day
        //
        //     return [year, month, day].join('-')
        // }

        this.character = {};

        this.req = {
          'character': {},
          'va': []
        };

        this.va = [];

        this.update = update;
        this.submit = submit;
        this.submitVA = submitVA;
        this.updateVA = updateVA;
        this.deleteVA = deleteVA;
        this.addC2N = addC2N;
        this.deleteC = deleteC;

        let url = 'http://localhost:3000/api/db/characters/:id';
        let url_2 = 'http://localhost:3000/api/db/novels/:novel_id/characters/:id';
        let url_3 = 'http://localhost:3000/api/db/novels/:novel_id/characters/:character_id/voice_actresses/:id';

        function addC2N(c_id) {
            $resource('http://localhost:3000/api/db/novels/:novel_id/characters/:id')
                .save({ novel_id: this.novel.id, id: c_id }, {},
                    (message) => {
                        console.log(message);
                    }, (message) => {
                        console.log(message);
                    });
        }

        function update() {
            $resource(url, {}, { 'update': { method: 'PUT' } }).update({ id: 1 }, this.req.character, (message) => {
                console.log(message);
            }, (message) => {
                console.log(message);
            });
        }

        function submit() {
            $resource(url_2).save({ novel_id: 2 }, this.req.character, (message) => {
                console.log(message);
            }, (message) => {
                console.log(message);
            });
        }

        function submitVA(n_id, c_id, p_id) {
            $resource(url_3)
                .save({ novel_id: n_id, character_id: c_id, id: p_id }, {},
                    (message) => {
                        console.log(message);
                    }, (message) => {
                        console.log(message);
                    });
        }

        function updateVA(n_id, c_id, va_id, va) {
            $resource(url_3, {}, { 'update': { method: 'PUT' } }).update({ novel_id: n_id, character_id: c_id, id: va_id }, va, (message) => {
                console.log(message);
            }, (message) => {
                console.log(message);
            });
        }

        function deleteVA(n_id, c_id, va_id) {
            $resource(url_3).delete({ novel_id: n_id, character_id: c_id, id: va_id }, (message) => {
                console.log(message);
            }, (message) => {
                console.log(message);
            });
        }

        function deleteC(n_id, c_id) {
            $resource('http://localhost:3000/api/db/novels/:novel_id/characters/:id')
                .delete({ novel_id: n_id, id: c_id }, {},
                    (message) => {
                        console.log(message);
                    }, (message) => {
                        console.log(message);
                    });
        }

    }
})();
