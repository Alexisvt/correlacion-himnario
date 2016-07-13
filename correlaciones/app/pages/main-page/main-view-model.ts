import { Observable, EventData, PropertyChangeData } from 'data/observable';
import { alert, AlertOptions } from 'ui/dialogs';
import { Correlation } from '../../shared/correlation';
import * as CorrelationService from '../../services/correlation-service';
import { GestureEventData } from 'ui/gestures';
import { TextField } from 'ui/text-field';

export default class MainViewModel extends Observable {

  private _himnName = '';
  private _oldHimnNum: number | string = 0;
  private _newHimnNum: number | string = 0;
  private _enableSearchBynewHimnNum = false;

  constructor() {
    super();
  }

  searchCorrelation(): void {

  }

  // getter and setter

  public get himnName(): string {
    return this._himnName;
  }

  public set himnName(v: string) {

    if (this._himnName != v) {
      this._himnName = v;
      this.notify({ object: this, eventName: Observable.propertyChangeEvent, propertyName: 'himnName', value: v });
    }
  }

  public get oldHimnNum(): number | string {
    return this._oldHimnNum;
  }

  public set oldHimnNum(v: number | string) {

    this._oldHimnNum = v;
    this.notify({ object: this, eventName: Observable.propertyChangeEvent, propertyName: 'oldHimnNum', value: v });
    this.searchByOldHimnNum();

  }

  public get newHimnNum(): number | string {
    return this._newHimnNum;
  }

  public set newHimnNum(v: number | string) {

    this._newHimnNum = v;
    this.notify({ object: this, eventName: Observable.propertyChangeEvent, propertyName: 'newHimnNum', value: v });
    this.searchByNewHimnNum();

  }

  public get enableSearchBynewHimnNum(): boolean {
    return this._enableSearchBynewHimnNum;
  }

  public set enableSearchBynewHimnNum(v: boolean) {
    if (this._enableSearchBynewHimnNum != (!!v)) {
      this._enableSearchBynewHimnNum = !!v;
      this.notify({ object: this, eventName: Observable.propertyChangeEvent, propertyName: 'enableSearchBynewHimnNum', value: 0 });

      this.cleanSearchFields();
    }
  }

  // methods
  cleanNumField(args: GestureEventData): void {

    let textField = <TextField>args.view;
    console.log(textField.id);
    
    if (textField.id && textField.id === 'txtOld') {
      this.oldHimnNum = '';
    } else if (textField.id && textField.id === 'txtNew') {
      this.newHimnNum = '';
    }

  }

  onSwitchPropertyChange(): void {
    this.cleanSearchFields();
  }

  // methods
  private cleanSearchFields(): void {

    this.oldHimnNum = 0;
    this.newHimnNum = 0;
    this.himnName = '';

  }

  private searchByOldHimnNum(): void {

    if (this._oldHimnNum && this._oldHimnNum > 0 && !this._enableSearchBynewHimnNum) {
      CorrelationService.searchByOldNumber(+this._oldHimnNum)
        .then(
        (correlation: Correlation) => {
          this.set('newHimnNum', correlation.newNum);
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

  private searchByNewHimnNum(): void {

    if (this._newHimnNum && this._newHimnNum > 0 && this._enableSearchBynewHimnNum) {
      CorrelationService.searchByNewNumber(+this._newHimnNum)
        .then(
        (correlation: Correlation) => {
          this.set('oldHimnNum', correlation.oldNum);
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