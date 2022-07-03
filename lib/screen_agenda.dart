import 'controllers/agenda_controller.dart';
import 'ui/theme.dart';
import 'utils/user_simple_preference.dart';
import 'widgets/Button.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'screen_data_hora.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  String razaoSocial = "";
   final controller = AgendaSalaoController(); 

  @override
  void initState() {
    super.initState();

    razaoSocial = UserSimplePreferences.getRazaoSocial();

     controller.start();
  }

  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          AnimatedBuilder(              
              animation: controller.state,
              builder: (context, child){
                return stateManagement(controller.state.value);
              },
            ),
          //_addDateBar(),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 5),
      child: DatePicker(
        DateTime.now(),
        locale: 'pt_BR',
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: cadasClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _succes(){   
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index){
        var todo = controller.todos[index];
        return  ListTile(   
          leading: Icon(Icons.arrow_right),       
          title: Text("${todo.dia.toString().substring(8, 10)}/${todo.dia.toString().substring(5, 7)}/${todo.dia.toString().substring(0, 4)}"),
          subtitle: Text(todo.nomeDoCliente.toString()),
          trailing: Text(todo.horaInicio.toString()),       
          
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

  stateManagement(SaloesAgenState state){
    switch (state) {
      case SaloesAgenState.start:
          return _start();
      case SaloesAgenState.loading:
          return _start();
      case SaloesAgenState.start:
          return _loading();
      case SaloesAgenState.error:
          return _error();
      case SaloesAgenState.succes:
          return _succes(); 
        break;
      default:
       return _start();
    }
  }
 
  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Column(
        children: [
          Text("Salon - $razaoSocial",
              style: TextStyle(
                fontSize: 25,
                color: tema,
                fontFamily: 'Fantasy',
                fontWeight: FontWeight.w900,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat(" d ' de 'MMM' de 'y").format(DateTime.now()),
                      style: subHeadingStyle,
                    ),
                    Text(
                      'Hoje',
                      style: HeadingStyle,
                    )
                  ],
                ),
              ),
              MyButton(
                label: " Disponibilizar Horário",
                onTap: () => Get.to(
                  const DataHora(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
