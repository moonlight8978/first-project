class FormController {
    constructor($resource, $q) {
        this.$resource = $resource;
        this.product = {
            price: 0,
            title: '',
            original: '',
            product_type: ''
        };

    }

    submit() {
        this.$resource('http://localhost:3000/products/:id', { 'save': { method:'POST' } })
            .save(this.product, (response) => {
                console.log('Success!');
            });
    }
}

FormController.$inject = ['$resource', '$q'];

export default FormController;