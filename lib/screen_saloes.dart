import 'package:app_pedrapepeltesoura/screen_agenda_cliente.dart';
import 'utils/user_simple_preference.dart';
import 'controllers/agenda_controller.dart';
import 'screen_formulario_cliente.dart';
import 'ui/theme.dart';
import 'widgets/Button.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'screen_data_hora.dart';

class ScreenSaloes extends StatefulWidget {
  const ScreenSaloes({Key? key}) : super(key: key);

  @override
  State<ScreenSaloes> createState() => _ScreenSaloesState();
}

class _ScreenSaloesState extends State<ScreenSaloes> {
  DateTime _selectedDate = DateTime.now();
  final controller = SalaoController();

  _succes(){
    return ListView.builder(
      itemCount: controller.todosSaloes.length,
      itemBuilder: (context, index){
        var todo = controller.todosSaloes[index];
        //var id = todo.id;
        return ListTile(   
            leading: CircleAvatar(
              child: Text(todo.endereco!.estado.toString()),
              backgroundColor: principalClr,
              
            ), 
            trailing: Text(todo.endereco!.cidade.toString()),      
            title: Text(todo.razaoSocial.toString()),          
            subtitle: Text(todo.endereco!.bairro.toString() ),            
            onTap: () {
              UserSimplePreferences.setSalaoId(todo.id!);
              Get.to(AgendaCliente());
            },       
            
          );
        }
      );
    }
      
    
  
  _error(){
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: Text("Tentar novamente") ),
    );
  }
   _loading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  _start(){
    return Container();
  }

  stateManagement(SaloesState state){
    switch (state) {
      case SaloesState.start:
          return _start();
      case SaloesState.loading:
          return _start();
      case SaloesState.start:
          return _loading();
      case SaloesState.error:
          return _error();
      case SaloesState.succes:
          return _succes(); 
        break;
      default:
       return _start();
    }
  }
  @override
  void initState() {
   
    super.initState();
    controller.start();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body:AnimatedBuilder(
          animation: controller.state,
          builder: (context, child){
            return stateManagement(controller.state.value);
          }, ),
         // _addTaskBar(),
          // _listaAgenda()
        );    //_addDateBar(),
        
  }
   _appBar() {
    return AppBar(
      title: Image.asset(
        'imagem/salonmanager.png',
        fit: BoxFit.cover,
        height: 100,
      ),
      toolbarHeight: 100,
      centerTitle: true,
      elevation: 0,
      backgroundColor: appBarClr,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
    );
  }

}