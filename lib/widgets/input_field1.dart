import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/theme.dart';

//late bool _variavel = true;
//late bool _obscuretext = true;

class MyInputField1 extends StatelessWidget {
  //late Icon _icon;
  //late Color _color;
  //late bool _variavel;
  final Icon? icon;
  final bool obscuretext;
  final bool variavel;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField1(
      {Key? key,
      this.icon,
      this.obscuretext = false,
      this.variavel = false,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 30,
          width: 400,
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.only(left: 5),
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
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  cursorColor: Colors.black12,
                  controller: controller,
                  style: subtitleStile,
                  obscureText: obscuretext,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: subtitleStile,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.backgroundColor, width: 0)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.theme.backgroundColor, width: 0)),
                    /*suffixIcon: GestureDetector(
                      child: Icon(
                        variavel == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white,
                      ),
                      onTap: () {
                        setState() {
                          // _variavel = !_variavel;
                        }

                        ;
                      },
                    ),*/
                  ),
                ),
              ),
              widget == null ? Container() : Container(child: widget)
            ],
          ),
        )
      ]),
    );
  }

  void setState(Null Function() param0) {}
}
