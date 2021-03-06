import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/nested/aircraft.dart';
import '../../models/nested/cargo.dart';
import '../../util.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/validated_text.dart';
import '../../widgets/layout/card_allways_open.dart';
import '../../widgets/layout/div.dart';
import '../../widgets/layout/row2.dart';

class ChartCCard extends StatefulWidget {
  final nwfs = Cargo();
  final Aircraft air;
  final NotifyCargoValid onValidationChange;
  ///the inti state of false of this map is handled by the callback of validated text after drawn
  final childrenValid = LinkedHashMap<int, bool>();

  ChartCCard(this.air, this.onValidationChange);

  //iterates though map and calls back to permac
  bool getThisValid() {
    bool ret = true;
    childrenValid.forEach((_, value) {
      if (!value) {
        ret = false;
      }
    });
    onValidationChange(0, ret);
    return ret;
  }

  @override
  ChartCCardState createState() => ChartCCardState();
}

class ChartCCardState extends State<ChartCCard> {
  bool valid = false;
  List<Widget> body;

  @override
  initState() {
    super.initState();

    //init valididation within map
    this.widget.childrenValid[0] = false;
    this.widget.childrenValid[1] = false;

    ///init the basic acft nwfs
    this.widget.nwfs.name = 'Basic Aircraft';

    //init the cards body
    body = [
      Row2(
          Tex('Basic Weight'),
          ValidatedText(
            inputType: 1,
            maxChars: 12,
            notifyIsValid: (b) {updateValidChildren(0,b);},
            validateText: _validateWeight,
            onChange: 
              (weight) =>this.widget.nwfs.weight = parsedouble(weight),
          )),

      Div(),

      Row2(
          Tex('Basic Moment'),
          ValidatedText(
            maxChars: 12,
            inputType: 1,
            notifyIsValid: (b) {updateValidChildren(1,b);},
            validateText: _validateMoment,
            onChange: (mom) =>
              this.widget.nwfs.setMom(parsedouble(mom))
            ,
          )),
    ];
  }

  bool _validateWeight(String weight) {
    if (double.tryParse(weight) != null &&
        double.parse(weight) >= this.widget.air.weight0 &&
        double.parse(weight) <= this.widget.air.weight1) {
      return true;
    }
    return false;
  }

  bool _validateMoment(String mom) {
    if (double.tryParse(mom) != null &&
        double.parse(mom) >= this.widget.air.mom0 &&
        double.parse(mom) <= this.widget.air.mom1) {
      return true;
    }
    return false;
  }

   /// 0= weight, 1=moment
  void updateValidChildren(int id, bool valid) {
    //insert validation into map
    this.widget.childrenValid[id] = valid;

    //iterate though map to see if all children are valid
    bool newValid = this.widget.getThisValid();

    //if validation has changed, update ti
    if (this.valid != newValid) {
      setState(() {
        this.valid = newValid;
      });
    }
  }

  @override
  Widget build(_) {
    return CardAllwaysOpen(
      name: 'Chart C',
      color: getValidColor(valid),
      children: body,
    );
  }
}
