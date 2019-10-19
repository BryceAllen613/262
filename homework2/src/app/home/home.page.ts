import { Component, OnInit } from '@angular/core';
import { Storage } from '@ionic/storage';
//import { SettingsService } from '../services/settings.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  public userName: string;
  public color: string;

  constructor(public storage: Storage) {}

  public set(name, value)
  {
    console.log(name);
    return  this.storage.set('setting:${ name }', value);
    console.log(value);
  }

  public async get(settingName) 
  {
    return await this.storage.get('setting:${ name }');
  }

  public async remove(settingName) 
  {
    return await this.storage.remove('setting:${ name }');
  }

  public clear() {
    this.storage.clear().then(() => {
      console.log('all keys cleared');
    });
  }

}
