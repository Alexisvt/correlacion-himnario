import { EventData, Observable } from 'data/observable';
import { Page } from 'ui/page';
import MainViewModel from './main-view-model';
import { TextField } from 'ui/text-field';

let page: Page;
let vm = new MainViewModel();

export function onLoaded(args: EventData) {
  page = <Page>args.object;
  page.bindingContext = vm;

  // attaching an eventhanlder to listen changes on the field value
  let oldHimnTextField = <TextField>page.getViewById('txtOld');
  oldHimnTextField.on(Observable.propertyChangeEvent, vm.searchByOldHimnNum.bind(vm))

  let newHimnTextField = <TextField>page.getViewById('txtNew');
  newHimnTextField.on(Observable.propertyChangeEvent, vm.searchByNewHimnNum.bind(vm));
}