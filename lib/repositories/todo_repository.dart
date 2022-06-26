
import 'package:dio/dio.dart';
import 'package:flutter_application_8/models/todo_model.dart';

class TodoRepository{
  final dio = Dio();
  final url = 'https://monktechwebapi-asd.azurewebsites.net/api/Agendas';

  Future <List<TodoModel>>fetchTodos() async{
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json)=> TodoModel.fromJson(json)).toList();

   /* List<TodoModel> todos = [];

    for (var json in list){
      final todo = TodoModel.fromJson(json);
      todos.add(todo);
    }

    return todos;*/
  
  }
}