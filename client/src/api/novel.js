import axios from 'axios';

import { server } from './config';

class NovelApi {
  constructor() {
    this.url = `//${server.url}:${server.port}${server.db}/novels`;
  }
  
  async get(params) {
    const results = await axios.get(`${this.url}/${params.id}`);
    return results.data;
  }
}

export default NovelApi;