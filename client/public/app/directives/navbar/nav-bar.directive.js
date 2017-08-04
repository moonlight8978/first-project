(function () {
    'use strict';

    angular
        .module('app')
        .directive('navBar', navBar);

    function navBar() {
        return {
            controller: function() {
                $(function() {
                    let nav = $('nav');
                    let navHeight = nav.outerHeight();
                    $(window).on('scroll.navBar', () => {
                        if ($(this).scrollTop() >= 400) {
                            nav.addClass('fixed-top').show();
                        } else if ($(this).scrollTop() > navHeight && $(this).scrollTop() < 400) {
                            nav.slideUp(300);
                        } else {
                            nav.show().removeClass('fixed-top');
                        }
                    });

                    scope.$on('$destroy', () => {
                        unbind();
                    });

                    function unbind() {
                        $(window).off('scroll.navBar');
                    }
                });
            }
        };
    }
})();
