import { Observable } from 'data/observable';
import { Correlation } from '../../shared/correlation';
import * as CorrelationService from '../../services/correlation-service';

export default class MainViewModel extends Observable {

  himnName = '';
  oldNum = 0;
  newNum = 0;

  constructor() {
    super();
  }

  searchCorrelation(): void {

    console.log('searching');

    if (this.oldNum !== 0 && this.oldNum > 0) {
      CorrelationService.searchByOldNumber(this.oldNum)
        .then(
        (correlation: Correlation) => {
          this.set('newNum', correlation.newNum);
          this.set('himnName', correlation.name);
        },
        function onRejected(message: any) {
          console.log(`something happened: ${message}`);
        });
    } else if (this.newNum !== 0 && this.newNum > 0) {
      CorrelationService.searchByNewNumber(this.newNum)
        .then((correlation: Correlation) => {
          this.set('newNum', correlation.oldNum);
          this.set('himnName', correlation.name);
        });
    }
  }
}