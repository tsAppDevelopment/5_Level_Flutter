import 'dart:collection';
import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../models/nested/cargo.dart';
import '../../util.dart';
import '../../widgets/display/text.dart';
import '../../widgets/input/custom_button.dart';
import '../../widgets/input/validated_text.dart';
import '../../widgets/layout/align_padding.dart';
import '../../widgets/layout/ccard.dart';
import '../../widgets/layout/div.dart';
import '../../widgets/layout/row1.dart';
import '../../widgets/layout/row2.dart';

class ValidatedCargoUI extends StatefulWidget {
  final num fs0, fs1, cargoMaxWeight;
  final Cargo nwf;
  final IntCallBackIntPara onRemovePressed;
  final NotifyCargoValid notifyValid;

  ValidatedCargoUI(
      {@required this.fs0,
      @required this.fs1,
      @required this.cargoMaxWeight,
      @required this.nwf,
      @required this.onRemovePressed,
      @required this.notifyValid})
      : super(key: UniqueKey());

  @override
  ValidatedCargoUIState createState() => ValidatedCargoUIState();
}

class ValidatedCargoUIState extends State<ValidatedCargoUI> {
  bool valid = false;
  var childValid = LinkedHashMap<int, bool>();
  bool ope = false;

  @override
  initState() {
    super.initState();

    //init valid map to refect init state of nwfs
    childValid[0] = validateName(this.widget.nwf.name);
    childValid[1] = validateWeight(this.widget.nwf.weight.toString());
    childValid[2] = validateFS(this.widget.nwf.fs.toString());
    childValid[3] = validateQty(this.widget.nwf.qty.toString());
    
    //call back because this may set state again 
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateAllValid();
    });
  }



  /// put new value into map of all children
  void updateValid(int id, bool val) {
    childValid[id] = val;
    updateAllValid();
  }

  void updateAllValid() {
    // are all children valid?
    var ret = true;
    childValid.forEach((_, value) {
      if (!value) {
        ret = false;
      }
    });

    //open the card if closed & invalid
    bool wasOpened =false;
    if(this.ope == ret){
      ope = true;
      wasOpened =true;
    }

    //if valid has chaged:
    if (this.valid != ret || wasOpened) {
      //notify parent: cargocard
      this.widget.notifyValid(this.widget.nwf.id, ret);
      setState(() {this.valid = ret;});
    }
  }

  bool validateName(String x) {
    if (x.length >= 1) {return true;}
    return false;
  }

  bool validateWeight(String x) {
    if (double.tryParse(x) != null &&
        double.parse(x) > 0 &&
        double.parse(x) <= this.widget.cargoMaxWeight) {
      return true;
    }
    return false;
  }

  bool validateFS(String x) {
    if (double.tryParse(x) != null &&
        double.parse(x) >= this.widget.fs0 &&
        double.parse(x) <= this.widget.fs1) {
      return true;
    }
    return false;
  }

  bool validateQty(String x) {
    if (int.tryParse(x) != null && int.parse(x) > 0) {
      return true;
    }
    return false;
  }

  void changeName(String x) {
    this.widget.nwf.name = x;
    setState(() {});
  }

  void changeWeight(String x) {
    this.widget.nwf.weight = parsedouble(x);
    //setState(() {});
  }

  void changeFS(String x) {
    this.widget.nwf.fs =  parsedouble(x);
    //setState(() {});
  }

  void changeQty(String x) {
    this.widget.nwf.qty =  parseint(x);
    setState(() {});
  }

  List<Widget> buildChildren(){
    return [
      Row1(ValidatedText(
        initText: this.widget.nwf.name,
        inputType: 2,
        onChange: changeName,
        maxChars: 30,
        validateText: validateName,
        width: double.infinity, 
        notifyIsValid: (v) {updateValid(0, v);},
      )),
      Div(),
      Row2(
          Tex('Weight'),
          ValidatedText(
            notifyIsValid: (v) {updateValid(1, v);},
            initText: this.widget.nwf.weight.toString(),
            inputType: 1,
            onChange: changeWeight,
            maxChars: 8,
            validateText: validateWeight,
          )),
      Div(),
      Row2(
          Tex('Fuselage Station'),
          ValidatedText(
            notifyIsValid: (v) {updateValid(2, v);},
            initText: this.widget.nwf.fs.toString(),
            inputType: 1,
            onChange: changeFS,
            maxChars: 8,
            validateText: validateFS,
          )),
      Div(),
      Row2(
          Tex('Qty'),
          ValidatedText(
            notifyIsValid: (v) {updateValid(3, v);},
            initText: this.widget.nwf.qty.toString(),
            inputType: 1,
            onChange: changeQty,
            maxChars: 8,
            validateText: validateQty,
          )),
      Div(),
      Row1(CustomButton(
        'Remove',
        onPressed: () {
          this.widget.onRemovePressed(this.widget.nwf.id);
        },
      )),
    ];
  }

  List<Widget> buildInput() {
    if (ope) {
      return buildChildren();
    }
    return [Container()];
  }

  toggle() {
    setState(() {
      ope = !ope;
    });
  }

  Widget getCardTitle() {
    if (ope) {
      return TitleCC(
          open: true,
          tex: Tex(
            this.widget.nwf.qty.toString() + ' EA ' + getTruncated(this.widget.nwf.name,30),
            fontWeight: FontWeight.normal,
            color: getValidColor(valid),
          ));
    }
    return TitleCC(
        open: false,
        tex: Tex(
          this.widget.nwf.qty.toString() + ' EA ' + getTruncated(this.widget.nwf.name,30),
          fontWeight: FontWeight.normal,
          color: getValidColor(valid),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.fromLTRB(cardP, cardP, cardP, 0.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: cargoUIColor,
                shape: Border(
                    top: BorderSide(
                  color: cargoUIColor,
                  width: cardTabSize,
                )),
                child: Column(
                  children: [
                    InkWell(
                      key: Key('tap'),
                      child:
                          AlignPadding(3.0, Alignment.center, getCardTitle()),
                      onTap: toggle,
                    ),
                    Column(children: buildInput())
                  ],
                ))));
  }
}
