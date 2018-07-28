import { EventData, Observable } from 'data/observable';
import { Page } from 'ui/page';
import MainViewModel from './main-view-model';
import { TextField } from 'ui/text-field';
import { Switch } from 'ui/switch';

let page: Page;
let vm = new MainViewModel();

export function onLoaded(args: EventData) {
  page = <Page>args.object;
  page.bindingContext = vm;
}