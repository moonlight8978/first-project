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
            'very_short': '短い＋',
            'short': '短い',
            'medium': '並',
            'long': '長い',
            'very_long': '長い＋',
            'full': {
                'very_short': 'とても短い(<2時間)',
                'short': '短い(2 - 10時間)',
                'medium': '並(10 - 30時間)',
                'long': '長い(30 - 50時間)',
                'very_long': 'とても長い(>50時間)'
            }
        });
})();
