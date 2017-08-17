import axios from 'axios';

const NOVEL_URL = '//localhost:3000/api/db/novels'

export function getNovel(id) {
  return axios.get(`${NOVEL_URL}/${id}`, { params: { fullInfo: 1 } });
}