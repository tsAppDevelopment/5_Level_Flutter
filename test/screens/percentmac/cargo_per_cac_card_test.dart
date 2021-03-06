import 'package:five_level_one/models/nested/cargo.dart';
import 'package:five_level_one/models/nested/per_mac.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:five_level_one/screens/percentmac/cargo_per_mac_card.dart';

class PerMacMock extends Mock implements PerMac{}

PerMacMock getPerMac(){
  final ret = PerMacMock();
  final nwfss = getNwfs();


  when(ret.mommultipler).thenReturn(10000);
  when(ret.nwfss).thenReturn(nwfss);
  when(ret.grandTotQty).thenReturn('grand');
  when(ret.totSimpleMomAsString).thenReturn('tot simp mom');
  when(ret.totUnSimpMomAsString).thenReturn('tot un simp mom');
  when(ret.totWeightAsSting).thenReturn('tot weight');
  return ret;
}

Widget mk(Widget child){
  return MaterialApp(home: child);
}

List<Cargo> getNwfs(){
  List<Cargo> ret = [];

    ret.add(Cargo(name: 'cargo1', weight: 100, qty: 2, fs: 500, ));
    ret.add(Cargo(name: 'cargo2', weight: 100, qty: 2, fs: 500, ));
  
  return ret;
}

main(){
  testWidgets(
    'given a cargopermaccard, then it will draw all data',
    (WidgetTester wt) async {

      //given 
      final test = mk(CargoPerMacCard(getPerMac()));

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.text('grand'), findsOneWidget);
      expect(find.text('tot simp mom'), findsOneWidget);
      expect(find.text('tot un simp mom'), findsOneWidget);
      expect(find.text('tot weight'), findsOneWidget);
      expect(find.text('cargo1'), findsOneWidget);
      expect(find.text('cargo2'), findsOneWidget);
    }
  );
}