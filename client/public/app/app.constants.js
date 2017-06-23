(function () {
    'use strict';

    angular
        .module('app')
        .constant('SERVER', {
          api:    'http://localhost:3000/api',
          search: 'http://localhost:3000/api/search',
          domain: 'http://localhost:3000',
          login:  'http://localhost:3000/login',
          logout: 'http://localhost:3000/logout'
        })
        .constant('LENGTH', {
            0: '＜２時間',
            1: '２－１０時間',
            2: '１０－３０時間',
            3: '３０－５０時間',
            4: '＞５０時間',
            full: {
                0: 'とても短い（＜２時間）',
                1: '短い（２－１０時間）',
                2: '並（１０－３０時間）',
                3: '長い（３０－５０時間）',
                4: 'とても長い（＞５０時間）'
            }
        });
})();
