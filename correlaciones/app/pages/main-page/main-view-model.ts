import { Observable } from 'data/observable';

export default class MainViewModel extends Observable {

  himnName = '';
  oldNum = 0;
  newNum = 0;

  constructor() {
    super();
  }

  searchTap(): void {
    console.log('searching');
  }
}