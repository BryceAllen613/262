import { Component } from '@angular/core';
import {TodoService} from '../services/todo.service'
import { Todo } from '../interfaces/todo'

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  public v1: string;
  public td: Todo;
  public result: string;
  private idCount;
  constructor(public todoService: TodoService) {
    
  }
  
  addTodo()
  {
    this.idCount++;
    this.td.description = this.v1;
    this.td.id = 1;
    this.todoService.addTodo(this.td);
  }
  
  getTodo()
  {
    this.result = this.todoService.getTodo(1).description;
    console.log(this.result);
  }
}
