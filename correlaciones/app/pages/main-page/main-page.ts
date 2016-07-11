import { EventData } from 'data/observable';
import { Page } from 'ui/page';
import MainViewModel from './main-view-model';

let page: Page;
let vm = new MainViewModel();

export function onLoaded(args:EventData) {
  page = <Page>args.object;
  page.bindingContext = vm;
}