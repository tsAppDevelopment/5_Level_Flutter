import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../util.dart';
import '../display/text.dart';
import 'align_padding.dart';

class CCard extends StatefulWidget {
  final String name;
  final List<Widget> children;
  final bool initOpen;
  final IntCallBack callBack;

  ///nullable, if null default value is rc()
  final Color color;

  CCard(
      {@required this.name,
      @required this.children,
      @required this.initOpen,
      this.callBack,
      this.color});

  @override
  _CCardState createState() => _CCardState();
}

class _CCardState extends State<CCard> {
  bool open;
  List<Widget> children;
  Color color;
  String name;

  @override
  void initState() {
    super.initState();
    name = getTruncated(this.widget.name, 30);
    color = this.widget.color ?? rc();
    open = this.widget.initOpen;
    children = this.widget.children;
  }

  ///toggles the cards open state
  List<Widget> getActive() {
    if (open) {
      return children;
    } else {
      return [Container()];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.fromLTRB(cardP, cardP, cardP, 0.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Card(
                color: cardColor,
                shape: Border(
                    top: BorderSide(
                  color: cardColor,
                  width: cardTabSize,
                )),
                child: Column(
                  children: [
                    InkWell(
                        child: AlignPadding(
                            3.0,
                            Alignment.center,
                            TitleCC(
                                open: open,
                                tex: Tex(
                                  name,
                                  color: color,
                                ))),
                        onTap: () => setState(() {
                              this.widget.callBack?.call();
                              open = !open;
                            })),
                    Column(children: getActive()),
                  ],
                ))));
  }
}

///used for cccard titles to create a title row with drop cards
class TitleCC extends StatelessWidget {
  final Tex tex;
  final bool open;
  TitleCC({@required this.tex, @required this.open});
  @override
  Widget build(BuildContext context) {
    if (open) {
      return Container(
          width: MediaQuery.of(context).size.width ,
          child: Row(children: [
            Icon(Icons.arrow_drop_up),
            Spacer(),
            tex,
            Spacer(),
            Icon(Icons.arrow_drop_up),
          ]));
    } else {
      return Container(
          width: MediaQuery.of(context).size.width / .8,
          child: Row(children: [
            Icon(Icons.arrow_drop_down),
            Spacer(),
            tex,
            Spacer(),
            Icon(Icons.arrow_drop_down),
          ]));
    }
  }
}
