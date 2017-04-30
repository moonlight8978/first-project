export class FormController {
    constructor($resource, $q) {
        this.$resource = $resource;
        this.eroge = {
            title: '',
            original_title: ''
        };
        let x = 
            $resource('http://localhost:3000/eroges/:id', { 'get': { method: 'GET' } })
                .get({ id: 2});
        $q.when(x.$promise).then((response) => {
            console.log(response);
        }, (response) => {
            console.log('Error!');
        });
    }

    submit() {
        this.$resource('http://localhost:3000/eroges/:id', { 'save': { method:'POST' } })
            .save(this.eroge, (response) => {
                console.log('Success!');
            });
    }
}

FormController.$inject = ['$resource', '$q'];