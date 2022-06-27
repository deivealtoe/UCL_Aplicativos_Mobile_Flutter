
import 'package:dio/dio.dart';
import 'package:flutter_application_8/models/todo_model.dart';

class TodoRepository{
  final dio = Dio();
  final url = 'https://monktechwebapi-asd.azurewebsites.net/api/Agendas';

  Future <List<TodoModel>>fetchTodos() async{
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json)=> TodoModel.fromJson(json)).toList();

  
  }
}
class SaloesRepository{
   final dio = Dio();
  final url = 'https://monktechwebapi-asd.azurewebsites.net/api/Saloes';

  Future <List<SaloesModel>>fetchTodos() async{
    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json)=> SaloesModel.fromJson(json)).toList();
  }
}