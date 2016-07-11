import { Observable } from 'data/observable';
import { Correlation } from '../../shared';
import { showAllCorrelations } from '../../services/correlation-service';

export default class CorrelationsViewModel extends Observable {

  // default values
  correlations: Correlation[] = [];

  constructor() {
    super();
    this.loadCorrelations();
  }

  private loadCorrelations(): void {
    showAllCorrelations().then((correlationList: Correlation[]) => {
      this.set('correlations', correlationList);
    },
      (message) => {
        console.log(`something happened: ${message}`);
      })
  }

}