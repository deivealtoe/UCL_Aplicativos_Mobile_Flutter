import 'dart:convert';

import 'screen_agenda.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen_cadastro.dart';
import 'ui/theme.dart';
import 'utils/user_simple_preference.dart';
import 'widgets/input_field1.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('Proprietário',
                    style: TextStyle(
                      fontSize: 30,
                      color: principalClr,
                    )),
                const SizedBox(
                  height: 10,
                ),
                MyInputField1(
                  hint: " Insira seu email",
                  controller: _emailController,
                ),
                MyInputField1(
                  hint: " Insira sua Senha",
                  controller: _senhaController,
                  obscuretext: true,
                ),
                TypeSizedBox_Space_Elements(),
                _appButtonLogar(),
                _appButtonEsqueciSenha(),
                _appButtonCadastro(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appButtonCadastro() {
    return Builder(
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('idade', 26);

              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Cadastro()),
              );
            },
            icon: const Icon(Icons.home),
            label: const Text(
              'Cadastrar',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            style: ElevatedButton.styleFrom(primary: cadasClr),
          ),
        );
      },
    );
  }

  _appButtonEsqueciSenha() {
    return Builder(
      builder: (context) {
        return SizedBox(
          height: 25,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.password_rounded),
            label: const Text('Esqueci minha senha'),
            style: ElevatedButton.styleFrom(primary: secundariaClr),
          ),
        );
      },
    );
  }

  _appButtonLogar() {
    return Builder(
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () async {
              print("Apertei em logar!");
              print(_emailController.text);
              print(_senhaController.text);

              var response = await http.post(
                Uri.parse(
                  "https://monktechwebapi-asd.azurewebsites.net/api/Contas/Login",
                ),
                headers: <String, String>{
                  'Content-Type': 'application/json',
                },
                body: jsonEncode(
                  <String, String>{
                    'email': _emailController.text,
                    'password': _senhaController.text
                  },
                ),
              );

              print(response.statusCode);
              print(response.body);

              if (response.statusCode == 200) {
                int salaoId = jsonDecode(response.body)['salaoId'];
                print(salaoId);
                UserSimplePreferences.setSalaoId(salaoId);

                String token = jsonDecode(response.body)['token'];
                print(token);
                UserSimplePreferences.setToken(token);

                var responseSalao = await http.get(
                  Uri.parse(
                    "https://monktechwebapi-asd.azurewebsites.net/api/Saloes/$salaoId",
                  ),
                );

                String razaoSocial =
                    jsonDecode(responseSalao.body)['razaoSocial'];
                print(razaoSocial);
                UserSimplePreferences.setRazaoSocial(razaoSocial);

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Agenda()),
                );
              }

              print(response.statusCode);

              if (response.statusCode != 200) {
                Form.of(context)?.validate();
                print(Form.of(context));
              }
            },
            icon: const Icon(Icons.login),
            label: const Text('Logar'),
            style: ElevatedButton.styleFrom(primary: principalClr),
          ),
        );
      },
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
          Icons.home,
          size: 30,
          color: principalClr,
        ),
      ),
    );
  }
}
