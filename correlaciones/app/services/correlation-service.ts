import { Correlation } from '../shared';
import * as FSModule from 'file-system';


const DOCUMENTS = FSModule.knownFolders.currentApp();
const CORRELATIONS_FILE = DOCUMENTS.getFile('data/correlations-es.json');

export function showAllCorrelations(): Promise<Correlation[]> {

  let jsonData: Array<Correlation> = [];

  return CORRELATIONS_FILE.readText()
    .then(function onFulfilled(content: string) {
      try {
        jsonData = <Array<Correlation>>JSON.parse(content);
      } catch (error) {
        return Promise.reject(`Couldn't parse the file for this reason: ${error}`);
      }
      return Promise.resolve(jsonData)
    },
    function (message: any) {
      console.log(message);
      return Promise.reject(`Couldn't load the file for this reason: ${message}`);
    });
}

