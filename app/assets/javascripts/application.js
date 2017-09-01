// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether/dist/js/tether.min
//= require popper.js/dist/umd/popper.min
//= require bootstrap/dist/js/bootstrap.min
//= require jquery-lazyload/jquery.lazyload
//= require wowjs

//= require rails-ujs
//= require turbolinks
//= require_tree .

(function () {
    const wow = new WOW({
        offset: 100
    });
    
    $(document).on('ready turbolinks:load', () => {
    	$(".lazy").lazyload({
    		effect : 'fadeIn'
    	});
    	wow.init();
        $(document).on('click', '.loz-link', () => console.log('loz'));
        const $loading = $('.loading');
        
        $(document)
            .on('ajax:send', '.pagination a', () => {
                console.log('asdasd')
                $loading.show();
            })
            .on('ajax:error', '.pagination a', (xhr, status, err) => {
                console.log(err);
                $loading.show();
            })
    });
})();
