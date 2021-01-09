import '../alignPadding.dart';
import '../../../Backend/cont.dart';
import 'package:flutter/material.dart';


class RowCenterOne extends StatelessWidget {
  final Widget w;
  RowCenterOne(this.w);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Const.rowHeight,
        margin: EdgeInsets.all(Const.rowInset),
        child: Center(child: w ),
      );
  }
}

class RowCenter extends StatelessWidget {
  final Widget w;
  RowCenter(this.w);

  @override
  Widget build(BuildContext context) {
    return AlignPadding(Const.rowInset, Alignment.center, this.w);
  }
}