import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  public v1: string;
  public v2: string;
  public result: number;
  public op: string;

  constructor() {}
  calculate() {
    const a = +this.v1;
    const b = +this.v2;
    if (this.op === '+')
    {
      this.result = a + b;
    }
    else if (this.op === '-')
    {
      this.result = a - b;
    } 
    else if (this.op === '/')
    {
      this.result = a / b;
    } 
    else if (this.op === '*')
    {
      this.result = a * b;
    }
    else
    {
      this.result = 0;
    }    
  }
}
