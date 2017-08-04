(function () {
    'use strict';

    angular
        .module('app')
        .directive('searchForm', searchForm);

    function searchForm() {
        return {
            link: function(scope, element, attrs) {
                angular.element(document).ready(() => {
                    let searchForm = $('#searchForm');
                    let searchInput = $('#searchInput');
                    let navItem = $('.-main .nav-item');
                    let searchCate = $('#searchCate');
                    let inputGroup = $('#inputGroup');

                    searchForm.focusin(() => {
                        navItem.each(function () {
                            $(this).addClass('invisible');
                        });
                        searchForm.addClass('active');
                        searchCate.fadeIn().addClass('visible');
                    });

                    $('#searchForm').focusout(() => {
                        $(window).on('click.checkFocusin', (event) => {
                            let trigger = $(event.target).closest('#searchForm');
                            $(window).off("click.checkFocusin");
                            // console.log(trigger);
                            if (trigger[0] != searchForm[0]) {
                                searchCate.fadeOut().removeClass('visible');
                                searchForm.removeClass('active');
                                navItem.each(function () {
                                    $(this).removeClass('invisible');
                                });
                            }
                        });

                    });

                    scope.$on('$destroy', () => {
                        unbind();
                    });

                    function unbind() {
                        $(window).off("click.checkFocusin");
                    }
                });
            }
        };
    }
})();
