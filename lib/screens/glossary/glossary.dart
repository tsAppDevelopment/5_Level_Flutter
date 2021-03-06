import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/nested/glossary.dart';
import '../../widgets/display/row_center_text.dart';
import '../../widgets/layout/ccard.dart';

class GlossaryScreen extends StatefulWidget {
  final List<Glossary> glossarys;

  GlossaryScreen(this.glossarys): super(key: PageStorageKey(UniqueKey()));
  _GlossaryScreenState createState() => _GlossaryScreenState();
  }

class _GlossaryScreenState extends State<GlossaryScreen> {
  final sc = ScrollController();

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
        isAlwaysShown: true,
        controller: sc,
        child: ListView.builder(
            controller: sc, //ony render on screen widgets-recycle viewer
            itemCount: this.widget.glossarys.length,
            itemBuilder: (BuildContext context, int i) {
              return CCard(
                name: this.widget.glossarys[i].name,
                children: [RowCenterText(this.widget.glossarys[i].body)],
                initOpen: true,
            );}));
  }
}
