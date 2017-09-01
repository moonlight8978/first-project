(function () {
    function checkImage(url) {
        return new Promise((resolve, reject) => {
            let img = new Image();
            img.onload = () => resolve(url);
            img.onerror = () => reject(0);
            img.src = url;
        });
    }
    
    function loadImage() {
        $('[data-background-image]').each(function () {
            const $this = $(this);
            checkImage($this.data('backgroundImage'))
                .then((url) => {
                    $this.css({ backgroundImage: `url('${url}')` });
                }).catch((e) => {
                    $this.css({ backgroundImage: 'url("placeholder.jpg")' });
                });
        });
    }
    
    $(document).on('ready turbolinks:load', loadImage);
})();
