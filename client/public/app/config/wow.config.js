(function () {
    'use strict';

    angular
        .module('app')
        .config(wowConfig);

    function wowConfig() {
        new WOW().init();
    }
})();
