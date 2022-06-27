import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_salonmanager/screen_agenda.dart';
import 'package:app_salonmanager/screen_cadastro.dart';
import 'package:app_salonmanager/screen_saloes.dart';
import 'package:app_salonmanager/ui/theme.dart';
import 'package:app_salonmanager/widgets/Button.dart';
import 'package:app_salonmanager/widgets/input_field1.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/theme.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController nom = new TextEditingController();
  TextEditingController tel = new TextEditingController();

  //DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(children: [
          _addTaskBar(),
          //_appButtonEnviar(),
          //_addDateBar(),
        ]));
  }

  /*_addDateBar() {
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
  }*/

  _addTaskBar() {
    return Container(
      //margin: const EdgeInsets.only(left: 1, right: 1, top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Preencha suas informações:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17, fontFamily: 'Roboto', color: Colors.black),
                ),
                MyInputField1(
                  hint: "Nome",
                  controller: nom,
                ),
                MyInputField1(
                  hint: "Telefone",
                  controller: tel,
                ),
                TypeSizedBox_Space_Elements(),
                ElevatedButton.icon(
                  onPressed: () async {
                    print("Clicou em Cadastrar!");
                    print("Nome: " + nom.text);
                    print("Telefone: " + tel.text);

                    var response = await http.put(
                      Uri.parse(
                          "https://monktechwebapi-asd.azurewebsites.net/api/Agendas/Agendar/{idDoSalao}"),
                      headers: <String, String>{
                        'Content-Type': 'application/json',
                      },
                      body: jsonEncode(<String, String>{
                        'nomeDoCliente': nom.text,
                        'telefoneDoCliente': tel.text,
                      }),
                    );

                    print(response.statusCode);

                    if (response.statusCode == 201) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => Salao_cliente()),
                      );
                    } else {}
                  },
                  icon: Icon(Icons.login),
                  label: Text('Enviar'),
                  style: ElevatedButton.styleFrom(primary: principalClr),
                ),
              ],
            ),
          ),
          /*MyButton(
              label: "Marcar horário", onTap: () => Get.to(const DataHora()
              )
              )*/
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
          print("Telefone: " + tel.text);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          //size: 20,
        ),
      ),
    );
  }
}

/*_appButtonEnviar() {
  return Builder(builder: (context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
          onPressed: () async {
            print("Clicou em Cadastrar!");
            print("Nome: " + nom.text);
            print("Telefone: " + tel.text);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Salao_cliente()),
            );
          },
          icon: Icon(Icons.login),
          label: Text('Enviar'),
          style: ElevatedButton.styleFrom(primary: principalClr)),
    );
  });
}*/
