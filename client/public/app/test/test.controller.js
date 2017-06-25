(function () {
    'use strict';

    angular
        .module('app')
        .controller('TestController', TestController);

    TestController.$inject = ['$resource'];

    function TestController($resource) {
        $resource('http://localhost:3000/api/novels/:id').query(function (response) {
            console.log('yatta');

        });
        // NovelService.novels.query((novels) => {
        //     this.novels = novels;
        //     console.log('やった');
        // });
    }
})();
