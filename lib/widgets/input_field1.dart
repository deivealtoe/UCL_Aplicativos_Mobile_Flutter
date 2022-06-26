import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/theme.dart';

class MyInputField1 extends StatelessWidget {
  
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField1({Key? key,required this.hint,this.controller,this.widget,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color:Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget==null?false:true,
                    autofocus: false,
                    cursorColor: Colors.black12,
                    controller: controller,
                    style: subtitleStile,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subtitleStile,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0)
                      )
                    ),
                  ),
                  ),
                widget==null?Container():Container(child: widget)
              ],
              ),
          )
        ]),
    );
  }
}