(function () {
    'use strict';

    angular
        .module('app')
        .config(wowConfig);

    function wowConfig() {
        let wow = new WOW({
          offset: 100
        });
        wow.init();
    }
})();
