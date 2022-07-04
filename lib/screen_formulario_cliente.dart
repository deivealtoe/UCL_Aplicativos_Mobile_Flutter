import 'dart:convert';
import 'package:app_salonmanager/utils/user_simple_preference.dart';
import 'screen_cadastro.dart';
import 'screen_saloes.dart';
import 'ui/theme.dart';
import 'widgets/input_field1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  TextEditingController nom = TextEditingController();
  TextEditingController tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
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
                  print("NOM: $nom.text");
                  print("TEL: $tel.text");

                  print("n: $nom");

                  if (nom.text.isEmpty || tel.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Ambos os campos são obrigatórios.");
                  } else {
                    var response = await http.put(
                      Uri.parse(
                          "https://monktechwebapi-asd.azurewebsites.net/api/Agendas/Agendar/${UserSimplePreferences.getAgendaId()}"),
                      headers: <String, String>{
                        'Content-Type': 'application/json',
                      },
                      body: jsonEncode(
                        <String, dynamic>{
                          'nomeDoCliente': nom.text,
                          'telefoneDoCliente': tel.text
                        },
                      ),
                    );

                    print(UserSimplePreferences.getAgendaId());
                    print("Staus code:: ${response.statusCode}");

                    if (response.statusCode == 200) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ScreenSaloes()),
                      );
                    }

                    print(response.statusCode);
                  }
                },
                icon: const Icon(Icons.login),
                label: const Text('Enviar'),
                style: ElevatedButton.styleFrom(primary: principalClr),
              ),
            ],
          ),
        ),
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
        //onTap: () => Get.to(() => Inicial()),
        child: const Icon(
          Icons.arrow_back_ios,
          //size: 20,
        ),
      ),
    );
  }
}
