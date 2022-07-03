import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/theme.dart';

class MyInputField1 extends StatelessWidget {
  final Icon? icon;
  final bool obscuretext;
  final bool variavel;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField1({
    Key? key,
    this.icon,
    this.obscuretext = false,
    this.variavel = false,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 40,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (text) {
                    return 'Login e/ou senha incorreta. Tente novamente!';
                  },
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  cursorColor: Colors.black12,
                  controller: controller,
                  obscureText: obscuretext,
                  style: subtitleStile,
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subtitleStile,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor, width: 0)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor, width: 0))),
                ),
              ),
              widget == null ? Container() : Container(child: widget)
            ],
          ),
        )
      ]),
    );
  }
}

/*class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon;

  const CustomTextField({Key? key, required this.label, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text) {
        /*if (text == null || text.isEmpty) {
          return 'É necessário preencher todos os campos';
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Login()),
          );
        }*/
        return 'É necessário preencher todos os campos';
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
}*/
