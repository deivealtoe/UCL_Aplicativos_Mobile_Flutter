import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen_login.dart';
import 'ui/theme.dart';
import 'widgets/input_field1.dart';
import 'widgets/input_field_cep.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);
  @override
  State<Cadastro> createState() => _Cadastro();
}

class _Cadastro extends State<Cadastro> {
  TextEditingController cnpj = new TextEditingController();
  TextEditingController razaosocial = new TextEditingController();
  TextEditingController _cep = new TextEditingController();
  TextEditingController _estado = new TextEditingController();
  TextEditingController _cidade = new TextEditingController();
  TextEditingController _bairro = new TextEditingController();
  TextEditingController _rua = new TextEditingController();
  TextEditingController numero = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  TextEditingController repetirsenha = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _appBar(),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  //Dados da empresa
                  Text(
                    'Dados da empresa',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                  ),

                  MyInputField1(
                    hint: "CNPJ",
                    controller: cnpj,
                  ),
                  MyInputField1(hint: "Razão Social", controller: razaosocial),

                  TypeSizedBox_Space_Elements(),

                  Text(
                    'Endereço',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyInputFieldCep(
                        hint: "Cep",
                        controller: _cep,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          _consultaCep();
                        },
                        icon: Icon(Icons.loupe_rounded),
                        label: Text('Consultar Cep'),
                        style: ElevatedButton.styleFrom(primary: secundariaClr),
                      ),
                    ],
                  ),

                  MyInputField1(hint: "Estado", controller: _estado),
                  MyInputField1(hint: "Cidade", controller: _cidade),
                  MyInputField1(hint: "Bairro", controller: _bairro),
                  MyInputField1(hint: "Rua", controller: _rua),
                  MyInputField1(hint: "Numero", controller: numero),

                  TypeSizedBox_Space_Elements(),
                  //Login
                  Text(
                    'Login',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                  ),
                  MyInputField1(
                    hint: "E-mail ",
                    controller: email,
                  ),
                  MyInputField1(
                    hint: "Senha",
                    controller: senha,
                    obscuretext: true,
                    //variavel: true,
                  ),
                  MyInputField1(
                    hint: "Repita a Senha",
                    controller: repetirsenha,
                    obscuretext: true,
                    //variavel: true,
                  ),

                  TypeSizedBox_Space_Elements(),

                  Builder(builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          print("Clicou em Cadastrar!");

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          print(prefs.getInt('idade') ?? 0);

                          print("CNPJ: " + cnpj.text);
                          print("Razão Social: " + razaosocial.text);
                          print("Estado: " + _estado.text);
                          print("Cidade: " + _cidade.text);
                          print("Bairro: " + _bairro.text);
                          print("Rua: " + _rua.text);
                          print("Número: " + numero.text);
                          print("CEP: " + _cep.text);
                          print("E-mail: " + email.text);
                          print("Senha: " + senha.text);

                          var response = await http.post(
                            Uri.parse(
                                "https://monktechwebapi-asd.azurewebsites.net/api/Saloes"),
                            headers: <String, String>{
                              'Content-Type': 'application/json',
                            },
                            body: jsonEncode(<String, String>{
                              'cnpj': cnpj.text,
                              'razaoSocial': razaosocial.text,
                              'estado': _estado.text,
                              'cidade': _cidade.text,
                              'bairro': _bairro.text,
                              'rua': _rua.text,
                              'numero': numero.text,
                              'cep': _cep.text,
                              'email': email.text,
                              'password': senha.text
                            }),
                          );

                          print(response.statusCode);

                          Form.of(context)?.validate();

                          if (response.statusCode == 201) {
                            setPrefs();

                            Get.to(Login());
                          }
                        },
                        icon: Icon(Icons.save),
                        label: Text('Cadastrar'),
                        style: ElevatedButton.styleFrom(primary: principalClr),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('idade', 26);
  }

  _consultaCep() async {
    // Peguei o cep digitado
    String cep = _cep.text;

    //configurando a url
    var url = Uri.https('viacep.com.br', '/ws/$cep/json/');

    var response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    String estado = retorno["uf"];
    String cidade = retorno["localidade"];
    String bairro = retorno["bairro"];
    String rua = retorno["logradouro"];
    setState(() {
      _cidade.text = "${cidade}";
      _bairro.text = "${bairro}";
      _rua.text = "${rua}";
      _estado.text = "${estado}";
    });
  }
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
      child: Icon(
        Icons.arrow_back_ios,
        size: 20,
      ),
    ),
  );
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;

  const CustomTextField({Key? key, required this.label, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'É necessário preencher todos os campos';
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Login()),
          );
        }
      },
      cursorHeight: 15,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon == null ? null : Icon(icon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: new BorderSide(color: principalClr)),
          fillColor: Colors.white,
          filled: true),
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }
}

class TypeSizedBox_Space extends StatelessWidget {
  final double altura = 10;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: altura,
    );
  }
}

class TypeSizedBox_Space_Elements extends StatelessWidget {
  final double altura = 5;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: altura,
    );
  }
}
