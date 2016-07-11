import { Page } from 'ui/page';
import { EventData } from 'data/observable';
import { Correlation } from '../../shared';
import CorrelationsViewModel from './correlations-view-model';

let page: Page;
const vm = new CorrelationsViewModel(); 

export function onNavigatedTo(arg: EventData): void {
  page = <Page>arg.object;
  page.bindingContext = vm;
}

