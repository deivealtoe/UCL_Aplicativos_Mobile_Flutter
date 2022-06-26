import 'models/todo_model.dart';
import 'repositories/todo_repository.dart';

class AgendaController{
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  AgendaState state = AgendaState.start;

  AgendaController([TodoRepository? repository]) : _repository = repository ?? TodoRepository();

 Future  start() async{
    
    state = AgendaState.loading;
    try{
      todos = await _repository.fetchTodos();
      state = AgendaState.succes;
    } catch(e){
      state = AgendaState.error;
    }
  }

  

}
 enum AgendaState{ start, loading, succes, error}