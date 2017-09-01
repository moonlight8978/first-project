(function () {
    let $navbar;
    let active = false;
    
    function scrollNav() {
        window.addEventListener('scroll', function (event) {
            if (window.scrollY == 0) {
                active = false;
            } else {
                active = true;
            }
            
            if (active) {
                $navbar.addClass('active');
            } else {
                $navbar.removeClass('active');
            }
        });
    }
    
    $(document).on('ready turbolinks:load', () => {
        $navbar = $('#navbar');
        active = false;
    });
    $(document).ready(scrollNav);
})();