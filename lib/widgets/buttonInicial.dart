import 'package:app_pedrapepeltesoura/ui/theme.dart';
import 'package:flutter/material.dart';

class MyButtonInicial extends StatelessWidget {
  final String label;
  final Function()? onTap;
 
  const MyButtonInicial ({Key? key, required this.label, required this.onTap}) : super(key: key);

  
    @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child:Container(
        width: 320,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:principalClr,
          
        ),
        child: Center(
          child: Text(
            label, 
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),              
          ),
        )
         
      )
    );
  }
}