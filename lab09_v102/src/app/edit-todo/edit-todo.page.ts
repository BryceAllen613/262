import { Component, OnInit } from '@angular/core';
import { Todo } from '../interfaces/todo'
import { TodoService } from '../services/todo.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-edit-todo',
  templateUrl: './edit-todo.page.html',
  styleUrls: ['./edit-todo.page.scss'],
})
export class EditTodoPage implements OnInit {

  // vars made above constructor are available to whole class
  private todo: Todo;//access_specifier varName: type;

  constructor(private route: ActivatedRoute, private todoService: TodoService) { 
    
    this.todo = {
      id: this.todoService.todos.length,
      title: '',
      description: ''
    };
  }

  ngOnInit() {
    //grab id from route
    let id = this.route.snapshot.paramMap.get('id');

    if(id != null){
      this.todoService.load().then(() => {
        this.todo = this.todoService.getTodo(id);
      });
    }
  }
  
  saveTodo(){
    this.todoService.addTodo(this.todo);
  }
}
