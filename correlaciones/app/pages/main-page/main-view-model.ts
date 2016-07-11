import { Observable } from 'data/observable';
import { searchByOldNumber } from '../../services/correlation-service';

export default class MainViewModel extends Observable {

  himnName = '';
  oldNum = 0;
  newNum = 0;

  constructor() {
    super();
  }

  searchCorrelation(): void {
    console.log('searching');
  }
}