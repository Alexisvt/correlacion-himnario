import { Correlation } from '../shared';
import * as FSModule from 'file-system';
import * as _ from 'lodash';


const DOCUMENTS = FSModule.knownFolders.currentApp();
const CORRELATIONS_FILE = DOCUMENTS.getFile('data/correlations-es.json');
const ERROR_NUMBER_IS_NOT_FOUND = `No se encontr\u00f3 un himno asociado a ese n\u00famero, por favor, trate con otro`;

export function showAllCorrelations(): Promise<Correlation[]> {

  let jsonData: Array<Correlation> = [];

  const filePath = FSModule.path.join(DOCUMENTS.path, 'data/correlations-es.json');

  if (FSModule.File.exists(filePath)) {
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
        return Promise.reject(`Couldn't load the file for this reason: ${message}`);
      });

  } else {
    return Promise.reject('non existing file');
  }
}

export function searchByOldNumber(oldHimnNumber: number): Promise<Correlation> {
  return showAllCorrelations().then((correlationList: Correlation[]) => {

    let himn = _.find(correlationList, item => item.oldNum === oldHimnNumber);

    if (himn) {
      return Promise.resolve(himn);
    } else {
      return Promise.reject(ERROR_NUMBER_IS_NOT_FOUND);
    }
  });
}

export function searchByNewNumber(newHimnNumber: number): Promise<Correlation> {
  return showAllCorrelations().then((correlationList: Correlation[]) => {

    let himn = _.find(correlationList, item => item.newNum === newHimnNumber);

    if (himn) {
      return Promise.resolve(himn);
    } else {
      return Promise.reject(ERROR_NUMBER_IS_NOT_FOUND);
    }
  });
}

