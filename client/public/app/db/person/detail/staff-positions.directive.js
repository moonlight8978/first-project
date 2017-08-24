(function () {
    'use strict';

    angular
        .module('app')
        .directive('staffPositions', staffPositions);

    function staffPositions() {
        return {
            restrict: 'A',
            scope: {
                positions: '='
            },
            bindToController: true,
            controller: controller,
            controllerAs: 'vm',
            template: template(),
        };
        
        function controller() {
            const vm = this;
        }
        
        function template() {
            return (`
                <div class="staff-position-list">
                    <div class="staff-position" 
                        ng-repeat="position in vm.positions" 
                        ng-switch="position">
                        <div ng-switch-when="staff">スタフ</div>
                        <div ng-switch-when="vocals">ボカルー</div>
                        <div ng-switch-when="voice_actor">声優</div>
                        <div ng-switch-when="composer">作曲家</div>
                        <div ng-switch-when="artist">アルティスト</div>
                        <div ng-switch-when="scenario">シーン</div>
                    </div>
                </div>
            `);
        }
    }
})();