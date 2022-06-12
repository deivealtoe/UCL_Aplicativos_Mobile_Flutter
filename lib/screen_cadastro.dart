import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class _Cadastro extends State<Cadastro> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class Cadastro extends StatefulWidget {
  @override
  _Cadastro createState() => _Cadastro();
}

class Cadastros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //color: Color.fromARGB(255, 79, 79, 79),
        //theme: new ThemeData(
        //scaffoldBackgroundColor: Color.fromARGB(255, 79, 79, 79)),
        home: Scaffold(
            //backgroundColor: Color.fromARGB(255, 79, 79, 79),
            // GRAY COLOR ARGB = (255, 79, 79, 79)
            appBar: AppBar(
              title: Image.asset(
                'imagem/salonmanager.png',
                fit: BoxFit.cover,
                height: 100,
              ),

              leading: IconButton(
                onPressed: () {},
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
                //Dados da empresa
                Text(
                  'Dados da empresa',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'CNPJ',
                    icon: Icons.person,
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Razão Social',
                  ),
                ),

                TypeSizedBox_Space(),

                //Endereço
                Text(
                  'Endereço',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Estado',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Cidade',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Bairro',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Número',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Complemento',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Nome da rua',
                  ),
                ),

                TypeSizedBox_Space(),

                //Login
                Text(
                  'Login',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'E-mail',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Senha',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    label: 'Repita a senha',
                  ),
                ),

                TypeSizedBox_Space(),

                Builder(builder: (context) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          print(Form.of(context));
                          Form.of(context)?.validate();
                        },
                        icon: Icon(Icons.save),
                        label: Text('Cadastrar'),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(254, 136, 183, 1))),
                    // ROSE COLOR RGBO = (254, 136, 183, 1)
                  );
                }),

                // Botão
              ]),
            )))));
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  //final MaskTextInputFormatter mascara;

  const CustomTextField({Key? key, required this.label, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'É necessário preencher todos os campos';
        }
      },
      //inputFormatters: [mask],
      cursorHeight: 15,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon == null ? null : Icon(icon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide:
                  new BorderSide(color: Color.fromRGBO(254, 136, 183, 1))),
          fillColor: Colors.white,
          filled: true),
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
    );
  }
}

class TypeSizedBox_Space extends StatelessWidget {
  final double altura = 30;

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
