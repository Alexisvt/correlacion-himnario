import { Observable } from 'data/observable';

export default class MainViewModel extends Observable {

  himnName = '';
  himnOldNum = 0;
  himnNewNum = 0;

  constructor() {
    super();
  }

  searchTap(): void {
    console.log('searching');
  }
}