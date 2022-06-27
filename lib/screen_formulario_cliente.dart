import 'screen_agenda.dart';
import 'screen_cadastro.dart';
import 'screen_saloes.dart';
import 'ui/theme.dart';
import 'widgets/Button.dart';
import 'widgets/input_field1.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body:Form(
          child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ScreenSaloes()),
                      );
                    },
                    icon: Icon(Icons.login),
                    label: Text('Enviar'),
                    style: ElevatedButton.styleFrom(primary: principalClr),
                  ),
                ],
              ),
        ), )
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