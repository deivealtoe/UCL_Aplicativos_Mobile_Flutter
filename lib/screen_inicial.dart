import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen_agenda_cliente.dart';
import 'screen_login.dart';
import 'screen_saloes.dart';
import 'ui/theme.dart';
import 'widgets/buttonInicial.dart';

class Inicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarClr,
      appBar: _appBar(),
      body: Container(
        margin: const EdgeInsets.only(left: 14, right: 5, top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyButtonInicial(
                label: " Área do Cliente ",
                onTap: () => Get.to(
                  AgendaCliente(),
                ),
              ),
              const SizedBox(
                height: 18,
                width: 1000,
              ),
              MyButtonInicial(
                label: " Área do Estabelecimento ",
                onTap: () => Get.to(() => Login()),
              ),
            ],
          ),
        ),
      ),
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
        backgroundColor: appBarClr);
  }
}