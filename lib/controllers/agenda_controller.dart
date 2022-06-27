import 'package:flutter/cupertino.dart';

import '../models/todo_model.dart';
import '../repositories/todo_repository.dart';

class AgendaController{
  List<TodoModel> todos = [];
  final TodoRepository _repository;  
  final state = ValueNotifier<AgendaState>(AgendaState.start);

  AgendaController([TodoRepository? repository]) : _repository = repository ?? TodoRepository();

 Future  start() async{
    
    state.value= AgendaState.loading;
    try{
      todos = await _repository.fetchTodos();
      state.value = AgendaState.succes;
    } catch(e){
      state.value = AgendaState.error;
    }
  }  

}
 enum AgendaState{ start, loading, succes, error}
  enum SaloesState{ start, loading, succes, error}

class SalaoController{
  List<SaloesModel> todosSaloes = [];
  final SaloesRepository _repositorySaloes;  
  final state = ValueNotifier<SaloesState>(SaloesState.start);

  SalaoController([SaloesRepository? repository]) : _repositorySaloes = repository ?? SaloesRepository();

 Future  start() async{
    
    state.value= SaloesState.loading;
    try{
      todosSaloes = await _repositorySaloes.fetchTodos();
      state.value = SaloesState.succes;
    } catch(e){
      state.value = SaloesState.error;
    }
  }  

}
