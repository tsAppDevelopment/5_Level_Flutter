import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import '../../util.dart';
import '../../widgets/display/const_text.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/button_modal_spinner.dart';
import '../../widgets/layout/div.dart';
import '../../widgets/layout/row2.dart';

class YYYYMMDDLookup extends StatefulWidget {
  @override
  YYYYMMDDLookupState createState() => YYYYMMDDLookupState();
}

class YYYYMMDDLookupState extends State<YYYYMMDDLookup> {
  int yearIdx = DateTime.now().year-1;
  int jjjIdx = Jiffy(DateTime.now()).dayOfYear-1;
  int daysInyea = getDaysInYear(DateTime.now().year);

  List<String> getStringYear() {
    List<String> ret = [];
    for (int i = 1; i <= 3000; i++) {
      ret.add(i.toString());
    }
    return ret;
  }

  List<String> getStringDays() {
    List<String> ret = [];
    for (int i = 1; i <= daysInyea; i++) {
      ret.add(i.toString());
    }
    return ret;
  }

  String getYMDString() {
    return DateFormat('yyyy MM dd')
        .format(DateTime(yearIdx+1).add(Duration(days: jjjIdx)));
  }

  yearChange(int newyear) {
    setState(() {
      yearIdx = newyear;
      daysInyea = getDaysInYear(yearIdx+1);
      if (jjjIdx+1 > daysInyea) {
        jjjIdx--;
      }
    });
  }

  dayChange(int newjjj) {
    setState(() {
      jjjIdx = newjjj;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:5),
       child: Column(
        children: [
        Row2(
            Tex('YYYY'),
            ButtonModalSpinner(
              stringList: getStringYear(),
              onSpin: yearChange,
              initIdx: yearIdx,
            )),
        Div(),
        Row2(
            Tex('Julian Day'),
            ButtonModalSpinner(
              stringList: getStringDays(),
              onSpin: dayChange,
              initIdx: jjjIdx,
            )),
        Div(),
        Row2(Tex('YYYY MM DD'), ConstText(getYMDString())),
        ],
      )
    );
  }
}
