import { Observable, EventData, PropertyChangeData } from 'data/observable';
import { alert, AlertOptions } from 'ui/dialogs';
import { Correlation } from '../../shared/correlation';
import * as CorrelationService from '../../services/correlation-service';

export default class MainViewModel extends Observable {

  himnName = '';
  oldNum = 0;
  newNum = 0;
  searchByNewHimn = false;

  constructor() {
    super();
  }

  searchCorrelation(): void {

  }

  private cleanSearchFields(): void {
    this.set('oldNum', 0);
    this.set('newNum', 0);
    this.set('himnName', '');
  }

  searchByOldHimnNum(args: PropertyChangeData): void {

    if (args.value && args.value > 0 && !this.searchByNewHimn) {
      CorrelationService.searchByOldNumber(+args.value)
        .then(
        (correlation: Correlation) => {
          this.set('newNum', correlation.newNum);
          this.set('himnName', correlation.name);
        },
        (message: any) => {

          alert(<AlertOptions>{
            title: 'No se encontr\u00f3',
            message: message,
            okButtonText: 'ok'
          }).then(() => {
            this.cleanSearchFields();
          });

        });

    }

  }

  searchByNewHimnNum(args: PropertyChangeData): void {

    if (args.value && args.value > 0 && this.searchByNewHimn) {
      CorrelationService.searchByNewNumber(+args.value)
        .then(
        (correlation: Correlation) => {
          this.set('oldNum', correlation.oldNum);
          this.set('himnName', correlation.name);
        },
        (message: any) => {

          alert(<AlertOptions>{
            title: 'No se encontr\u00f3',
            message: message,
            okButtonText: 'ok'
          }).then(() => {
            this.cleanSearchFields();
          });

        });

    }
  }
}