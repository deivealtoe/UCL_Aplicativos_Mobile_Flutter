import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter_application_8/screen_cadastro.dart';
import 'package:flutter_application_8/screen_formulario_cliente.dart';
import 'package:flutter_application_8/screen_saloes.dart';
import 'package:http/http.dart';

import 'controllers/agenda_controller.dart';
import 'ui/theme.dart';
import 'widgets/Button.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

import 'screen_data_hora.dart';

class AgendaCliente extends StatefulWidget {

  final int? id ;


  const AgendaCliente({Key? key, this.id}) : super(key: key);   


  @override
  State<AgendaCliente> createState() => _AgendaClienteState();
}

class _AgendaClienteState extends State<AgendaCliente> {
  DateTime _selectedDate = DateTime.now();

  final controller = AgendaController();

  List<String> tod = [];
  
  
  
  TextEditingController _dia = new TextEditingController();
  TextEditingController _horaInicio = new TextEditingController();
  TextEditingController _horaFim = new TextEditingController();
  
  // ignore: recursive_getters
  int  get id => id;

  _succes(){
    _consultaAgenda();
    return ListView.builder(
      itemCount: tod.length,
      itemBuilder: (context, index){
        var todo = tod[index];
        return ListTile(   
          leading: Icon(Icons.arrow_right),       
          title: Text(tod[0]),
          subtitle: Text(tod[1]),
          trailing: Text(tod[2]),
          onTap:() => Get.to(  Formulario()),            
          
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

  stateManagement(AgendaState state){
    switch (state) {
      case AgendaState.start:
          return _start();
      case AgendaState.loading:
          return _start();
      case AgendaState.start:
          return _loading();
      case AgendaState.error:
          return _error();
      case AgendaState.succes:
          return _succes(); 
        break;
      default:
       return _start();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.start();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child){
            return stateManagement(controller.state.value);
          },),
    );       
      
  }
  _consultaAgenda() async {
    // Peguei o cep digitado
    int _id = id;

    //configurando a url
    var url = Uri.https('monktechwebapi-asd.azurewebsites.net', '/api/Agendas/Saloes/Disponiveis/$_id');

    var response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    String dia = retorno["dia"];
    String horainicio = retorno["horaInicio"];
    String horafim = retorno["horaFim"];
    
    setState(() {
      
      _dia.text = "${dia}";
      _horaInicio.text = "${horainicio}";
      _horaFim.text = "${horafim}";
     
    });
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
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Row(
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