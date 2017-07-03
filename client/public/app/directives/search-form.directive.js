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
                            $(this).addClass('hide');
                        });
                        $(this).addClass('active');
                        searchCate.fadeIn().addClass('show');
                    });

                    searchForm.focusout(function () {
                        searchCate.fadeOut().removeClass('show');
                        $(this).removeClass('active');
                        navItem.each(function () {
                            $(this).removeClass('hide');
                        });
                    });
                });
            }
        };
    }
})();
