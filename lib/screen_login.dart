import 'package:app_pedrapepeltesoura/screen_agenda.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen_cadastro.dart';
import 'ui/theme.dart';
import 'widgets/input_field1.dart';

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
          padding: EdgeInsets.all(20),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text('Proprietário',
                style: TextStyle(
                  fontSize: 30,
                  color: principalClr,
                )),
            SizedBox(
              height: 10,
            ),
            MyInputField1(
              hint: " Insira seu email",
              controller: _emailController,
            ),
            MyInputField1(
              hint: " Insira sua Senha",
              controller: _senhaController,
            ),
            TypeSizedBox_Space_Elements(),
            _appButtonLogar(),
            _appButtonEsqueciSenha(),
            _appButtonCadastro(),
          ]),
        ))));
  }

  _appButtonCadastro() {
    return Builder(builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Cadastro()),
              );
            },
            icon: Icon(Icons.home),
            label: Text('Cadastrar',
                style: TextStyle(color: Colors.black, fontSize: 15)),
            style: ElevatedButton.styleFrom(primary: cadasClr)),
      );
    });
  }

  _appButtonEsqueciSenha() {
    return Builder(builder: (context) {
      return SizedBox(
        height: 25,
        child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.password_rounded),
            label: Text('Esqueci minha senha'),
            style: ElevatedButton.styleFrom(primary: secundariaClr)),
      );
    });
  }

  _appButtonLogar() {
    return Builder(builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Agenda()),
              );
            },
            icon: Icon(Icons.login),
            label: Text('Logar'),
            style: ElevatedButton.styleFrom(primary: principalClr)),
      );
    });
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
        child: Icon(Icons.home, size: 30, color: principalClr),
      ),
    );
  }
}
