class ErogesController {
    constructor($resource) {
        this.eroges = [];
        $resource('http://localhost:3000/eroges/:id', { 'query': { method: 'GET', isArray: true } })
            .query((results) => {
                this.eroges = results;
                console.log('GET!');
            });
    }
}

ErogesController.$inject = ['$resource'];

export default ErogesController;