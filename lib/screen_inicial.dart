import 'package:flutter/material.dart';
import 'screen_cadastro.dart';
import 'screen_login.dart';

class Inicial extends StatelessWidget {
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
          //fit: BoxFit.cover,
          height: 200,
        ),

        /*leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
          iconSize: 50,
          color: Color.fromRGBO(254, 136, 183, 1),
          //alignment: Alignment.topRight,
          alignment: Alignment(-2, -2),
        ),*/

        toolbarHeight: 170,
        centerTitle: true,
        //backgroundColor: Color.fromARGB(255, 64, 64, 64),
        backgroundColor: Color.fromARGB(255, 79, 79, 79),
      ),

      body: Form(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          TypeSizedBox_Space(),

          SizedBox(
            height: 150,
          ),

          Builder(builder: (context) {
            return SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () {
                    print(Form.of(context));
                    Form.of(context)?.validate();
                  },
                  //icon: Icon(Icons.password_rounded),
                  icon: Icon(Icons.home),
                  label: Text('Área do cliente',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(254, 136, 183, 1))),
              // ROSE COLOR RGBO = (254, 136, 183, 1)
            );
          }),

          TypeSizedBox_Space_Elements(),

          Builder(builder: (context) {
            return SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                    //print(Form.of(context));
                    //Form.of(context)?.validate();
                  },
                  //icon: Icon(Icons.password_rounded),
                  icon: Icon(Icons.home),
                  label: Text('Área do estabelecimento',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(254, 136, 183, 1))),
              // ROSE COLOR RGBO = (254, 136, 183, 1)
            );
          }),

          // Botão
        ]),
      ))),
    ));
  }
}
