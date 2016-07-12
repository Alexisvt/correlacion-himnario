import { Correlation } from '../shared';
import * as FSModule from 'file-system';

const DOCUMENTS = FSModule.knownFolders.currentApp();
const CORRELATIONS_FILE = DOCUMENTS.getFile('data/correlations-es,json');

export function showAllCorrelations(): Promise<Correlation[]> {

  let jsonData: Array<Correlation> = [];
  const filePath = FSModule.path.join(DOCUMENTS.path, CORRELATIONS_FILE.name);
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
        console.log(message);
        return Promise.reject(`Couldn't load the file for this reason: ${message}`);
      });

  } else {
    console.log('non existing file');
    return Promise.reject('non existing file');
  }
}

export function searchByOldNumber(oldHimnNumber: number): Promise<Correlation> {
  return showAllCorrelations().then((correlationList: Correlation[]) => {
    let himn = correlationList.filter((correlation: Correlation) => correlation.oldNum === oldHimnNumber);
    console.log('Data of himn: ' + himn);
    if (himn !== null && himn.length > 0) {
      return Promise.resolve(<Correlation>himn[0]);
    } else {
      return Promise.reject(`Couldn't find the correlation with that number please try another one`);
    }
  });
}

export function searchByNewNumber(newHimnNumber: number): Promise<Correlation> {
  return showAllCorrelations().then((correlationList: Correlation[]) => {
    let himn = correlationList.filter((correlation: Correlation) => correlation.newNum === newHimnNumber);
    if (himn !== null && himn.length > 0) {
      return Promise.resolve(<Correlation>himn[0]);
    } else {
      return Promise.reject(`Couldn't find the correlation with that number please try another one`);
    }
  });
}

