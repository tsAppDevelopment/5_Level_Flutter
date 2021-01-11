import '../../backend/cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController c;

  CustomTextField(this.c);
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  InputDecoration dec;

  @override
  initState() {
    super.initState();
    dec = InputDec.div;
    this.widget.c.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight,
        width: Const.pickerWidth,
        child: TextField(
          cursorColor: Colors.white,
          controller: this.widget.c,
          decoration: dec,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[DecimalTextInputFormatter()],
          textAlign: TextAlign.center,
        ));
  }
}
