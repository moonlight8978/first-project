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
                    $(window).scroll(function () {
                        if ($(this).scrollTop() >= 300) {
                            nav.addClass('fixed-top').show();
                        } else if ($(this).scrollTop() > navHeight && $(this).scrollTop() < 300) {
                            nav.slideUp(300);
                        } else {
                            nav.show().removeClass('fixed-top');
                        }
                    });

                    let searchForm = $('#searchForm');
                    let searchInput = $('#searchInput');
                    let navItem = $('.-main .nav-item');
                    let searchCate = $('#searchCate');
                    searchInput.focusin(function () {
                        navItem.each(function () {
                            $(this).addClass('hide');
                        });
                        searchForm.addClass('active');
                        searchCate.addClass('show');
                    });

                    searchInput.focusout(function () {
                        searchCate.removeClass('show');
                        searchForm.removeClass('active');
                        navItem.each(function () {
                            $(this).removeClass('hide');
                        });
                    });

                    searchCate.focusin(function () {
                        searchInput.focusin();
                    });
                });
            }
        };
    }
})();
