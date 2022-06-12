import 'package:flutter/material.dart';
import 'screen_cadastro.dart';
import 'screen_inicial.dart';

/*
class _Login extends State<Login> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
} */

class Login extends StatelessWidget {
  late final String email;
  late final String senha;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //color: Color.fromARGB(255, 79, 79, 79),
        //theme: new ThemeData(
        //scaffoldBackgroundColor: Color.fromARGB(255, 79, 79, 79)),
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 79, 79, 79),
            // GRAY COLOR ARGB = (255, 79, 79, 79)
            appBar: AppBar(
              //iconTheme: IconThemeData(),
              title: Image.asset(
                'imagem/salonmanager.png',
                fit: BoxFit.cover,
                height: 100,
              ),

              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Inicial()),
                  );
                },
                icon: Icon(Icons.home),
                iconSize: 50,
                color: Color.fromRGBO(254, 136, 183, 1),
                //alignment: Alignment.topRight,
                alignment: Alignment(-2, -2),
              ),

              toolbarHeight: 150,
              centerTitle: true,
              //backgroundColor: Color.fromARGB(255, 64, 64, 64),
              backgroundColor: Color.fromARGB(255, 79, 79, 79),
            ),
            body: Form(
                child: SingleChildScrollView(
                    child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                SizedBox(
                  height: 150,
                ),
                Text('Proprietário',
                    style: TextStyle(
                        fontSize: 30, color: Color.fromRGBO(254, 136, 183, 1))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: email,
                    label: 'Insira seu e-mail',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: senha,
                    label: 'Insira a sua senha',
                  ),
                ),
                TypeSizedBox_Space_Elements(),

                Builder(builder: (context) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          print(Form.of(context));
                          Form.of(context)?.validate();
                        },
                        icon: Icon(Icons.login),
                        label: Text('Logar'),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(254, 136, 183, 1))),
                    // ROSE COLOR RGBO = (254, 136, 183, 1)
                  );
                }),

                TypeSizedBox_Space_Elements(),

                Builder(builder: (context) {
                  return SizedBox(
                    height: 25,
                    //width: double.infinity,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          //print(Form.of(context));
                          //Form.of(context)?.validate();
                        },
                        icon: Icon(Icons.password_rounded),
                        label: Text('Esqueci minha senha'),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 125, 120, 122))),
                    // ROSE COLOR RGBO = (254, 136, 183, 1)
                  );
                }),

                TypeSizedBox_Space(),

                Builder(builder: (context) {
                  return SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          //print(Form.of(context));
                          //Form.of(context)?.validate();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Cadastros()),
                          );

                          // if ('Insira seu e-mail' == null) {}
                        },
                        //icon: Icon(Icons.password_rounded),
                        icon: Icon(Icons.home),
                        label: Text('Cadastrar',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 249, 203, 226))),
                    // ROSE COLOR RGBO = (254, 136, 183, 1)
                  );
                }),

                // Botão
              ]),
            )))));
  }
}
