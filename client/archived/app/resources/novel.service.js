import { SERVER } from './../constants'

class NovelService {
    constructor($resource) {
        this.$resource = $resource;

        this.novel          = SERVER.API + '/novels/:id';
        this.novelStaff     = SERVER.API + '/novels/:id/staffs';
        this.novelCharacter = SERVER.API + '/novels/:id/characters';
        this.novelRelease   = SERVER.API + '/novels/:id/releases';
        this.novelTag       = SERVER.API + '/novels/:id/tags';
    }

    novel() {
        return this.$resource(this.novel, {
            'get':    { method: 'GET' },
            'save':   { method: 'POST' },
            'query':  { method: 'GET', isArray:true },
            'delete': { method: 'DELETE' }
        });
    }

    getStaffs() {
        return this.$resource(this.novelStaff, {
            'query': { method: 'GET', isArray:true }
        }
    }

}

NovelService.$inject = ['$resource']

export default NovelService;
