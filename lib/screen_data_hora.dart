import 'package:app_pedrapepeltesoura/ui/theme.dart';
import 'package:app_pedrapepeltesoura/widgets/Button.dart';
import 'package:app_pedrapepeltesoura/widgets/input_field.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/locale.dart';

class DataHora extends StatefulWidget {
  const DataHora({Key? key}) : super(key: key);

  @override
  State<DataHora> createState() => _DataHoraState();
}

class _DataHoraState extends State<DataHora> {
  final TextEditingController _servController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30  PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Adicione Horário",
                style: HeadingStyle,
              ),
              //MyInputField(title: " Serviço ", hint: " Digite o serviço ", controller: _servController,),

              MyInputField(
                title: " Data ",
                hint: DateFormat.yMd('pt_BR').format(_selectedDate),
                widget: IconButton(
                  icon: const Icon(Icons.calendar_today_outlined),
                  color: Colors.grey,
                  onPressed: () {
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: "Hora Inicial",
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: true);
                        },
                        icon: const Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: MyInputField(
                      title: "Hora Final",
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStartTime: false);
                        },
                        icon: const Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyButton(label: "Criar", onTap: () => _validateDate())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateDate() {
    if (_servController.text.isNotEmpty) {
      Get.back();
    } else if (_servController.text.isEmpty) {
      Get.snackbar(
        "Obrigatorio",
        " Todos os campos são obrigatorios",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appBarClr,
        colorText: Colors.red,
        icon: const Icon(
          Icons.warning_amber_rounded,
        ),
      );
    }
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
      backgroundColor: appBarClr,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
        ),
      ),
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2023));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    
    if (pickedTime == null) {

    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
