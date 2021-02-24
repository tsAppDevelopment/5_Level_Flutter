import 'package:flutter/material.dart';

import '../../backend/const.dart';
import '../../backend/utils.dart';
import '../../widgets/display/text.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IntCallBack onPressed;
  final Color color;
  CustomButton(this.text, {this.onPressed, this.color, Key key}): assert(text != null), super(key:key);
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.pickerHeight,
        width: Const.pickerWidth,
        decoration: BoxDecoration(
            color: Const.buttonColor, borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: FlatButton(
            onPressed: this.widget.onPressed ?? () {},
            child: Tex(
              this.widget.text,
              color: this.widget.color ?? Const.textColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ));
  }
}
