(function () {
    'use strict';

    angular
        .module('app')
        .controller('PersonMainInfoController', PersonMainInfoController);
    
    function PersonMainInfoController() {
        const vm = this;
        
        vm.birthday = birthday;
        vm.alias = alias;
        
        function birthday() {
            return `${vm.person.birthdayYear || '?'}年` +
                   `${vm.person.birthdayMonth || '?'}月` +
                   `${vm.person.birthdayDay || '?'}日`;
        }
        
        function alias() {
            let aliases; 
            if (vm.person.aliases.length) {
                aliases = vm.person.aliases.join('、');
            } else {
                aliases = 'ありません';
            }
            
            return aliases;
        }
    }
})();
