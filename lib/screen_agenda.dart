import 'package:app_pedrapepeltesoura/screen_data_hora.dart';
import 'package:app_pedrapepeltesoura/ui/theme.dart';
import 'package:app_pedrapepeltesoura/widgets/Button.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/locale.dart';

class ScreenAgenda extends StatefulWidget {
  const ScreenAgenda({Key? key}) : super(key: key);

  @override
  State<ScreenAgenda> createState() => _ScreenAgendaState();
}
class _ScreenAgendaState extends State<ScreenAgenda> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),  
          _addDateBar(),

          //_showTasks(),      
         
        ]
      )
    );
  }
 
  _addDateBar(){
    
    return  Container(
       
        margin: const EdgeInsets.only(top: 10, left: 5),
        child: DatePicker( 
          DateTime.now(), 
          locale: 'pt_BR',                     
          
          height: 100,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: primaryClr,
          selectedTextColor: Colors.white,
         
          dateTextStyle:  GoogleFonts.lato(
            
            textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey
          ),
          ),
          dayTextStyle:  GoogleFonts.lato(
            
            textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey
          ),
          ),
          monthTextStyle:  GoogleFonts.lato(
            textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey
          ),
          ),                                    
          onDateChange: (date){
            _selectedDate=date;
          },
        ),
      );
    }
  _addTaskBar(){

  return Container(
   
    margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(                 
          child:  Column(                  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat(" d ' de 'MMM' de 'y").format(DateTime.now()),
            style: subHeadingStyle,
            ),              
            Text('Hoje',
            style: HeadingStyle,
            )
          ],
        ),
        ),
        MyButton(label: " Marcar Horário", onTap: ()=>Get.to(ScreenDataHora()))
      ],
    ),
  );
}
  _appBar(){
  return AppBar( 
    title: Image.asset(
      'imagens/salonmanager.png',
      fit: BoxFit.cover,
      height: 100,
    ) , 
    toolbarHeight: 100,
    centerTitle: true,
    elevation: 0,    
    backgroundColor: Color.fromARGB(255, 79, 79, 79),
    leading: GestureDetector(
      onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios,
        size: 20,
        
      ),
    ),    
  );
}
}