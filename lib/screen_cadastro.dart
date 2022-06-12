import 'package:app_pedrapepeltesoura/screen_inicial.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'screen_login.dart';

//String email;

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
  late final String cnpj;
  late final String razaosocial;
  late final String estado;
  late final String cidade;
  late final String bairro;
  late final String rua;
  late final String numero;
  late final String complemento;
  late final String email;
  late final String senha;
  late final String repetirsenha;
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
                //Dados da empresa
                Text(
                  'Dados da empresa',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: cnpj,
                    label: 'CNPJ',
                    icon: Icons.person,
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: razaosocial,
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
                    //type: estado,
                    label: 'Estado',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: cidade,
                    label: 'Cidade',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: bairro,
                    label: 'Bairro',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: numero,
                    label: 'Número',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: complemento,
                    label: 'Complemento',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: rua,
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
                    //type: email,
                    label: 'E-mail',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: senha,
                    label: 'Senha',
                  ),
                ),
                TypeSizedBox_Space_Elements(),
                SizedBox(
                  height: 40,
                  child: CustomTextField(
                    //type: repetirsenha,
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
  //final String type;
  //final MaskTextInputFormatter mascara;

  const CustomTextField({Key? key, required this.label, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      /*onChanged: (text) {
         = text;
        //text = type;
      },*/
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'É necessário preencher todos os campos';
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Login()),
          );
        }
      },
      //inputFormatters: [mask],
      cursorHeight: 15,
      /*onChanged: (text) {
        type = text;
      },*/
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
