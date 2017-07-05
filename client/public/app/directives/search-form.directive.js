(function () {
    'use strict';

    angular
        .module('app')
        .directive('searchForm', searchForm);

    function searchForm() {
        return {
            controller: function() {
                $(function() {
                    let searchForm = $('#searchForm');
                    let searchInput = $('#searchInput');
                    let navItem = $('.-main .nav-item');
                    let searchCate = $('#searchCate');

                    searchForm.focusin(function () {
                        navItem.each(function () {
                            $(this).addClass('invisible');
                        });
                        $(this).addClass('active');
                        searchCate.fadeIn().addClass('visible');
                    });

                    searchForm.focusout(function () {
                        searchCate.fadeOut().removeClass('visible');
                        $(this).removeClass('active');
                        navItem.each(function () {
                            $(this).removeClass('invisible');
                        });
                    });
                });
            }
        };
    }
})();
