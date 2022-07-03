
import 'package:dio/dio.dart';
import 'package:app_pedrapepeltesoura/models/todo_model.dart';
import '../utils/user_simple_preference.dart';

class TodoRepository{
  

  Future <List<TodoModel>>fetchTodos() async{
    
    final dio = Dio();
    var url = 'https://monktechwebapi-asd.azurewebsites.net/api/Agendas/Saloes/Disponiveis/${UserSimplePreferences.getSalaoId()}';

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
class AgendaSalaoRepository{  

  Future <List<TodoModel>>fetchTodos() async{
    
    final dio = Dio();
    var url = 'https://monktechwebapi-asd.azurewebsites.net/api/Agendas/Saloes/${UserSimplePreferences.getSalaoId()}';

    final response = await dio.get(url);
    final list = response.data as List;

    return list.map((json)=> TodoModel.fromJson(json)).toList();

  
  }
}