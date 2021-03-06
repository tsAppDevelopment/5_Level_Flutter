import 'package:five_level_one/models/nested/per_mac.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:five_level_one/screens/percentmac/bal_arm_card.dart';

class PerMacMock extends Mock implements PerMac{}

PerMacMock getPerMac(){
  final ret = PerMacMock();

  when(ret.balArmAsString).thenReturn('bal arm');
  when(ret.totUnSimpMomAsString).thenReturn('tot un simp mom');
  when(ret.totWeightAsSting).thenReturn('tot weight');

  return ret;
}

Widget mk(Widget child){
  return MaterialApp(home: child);
}

main(){
  testWidgets(
    'given a cargopermaccard, then it will draw all data',
    (WidgetTester wt) async {

      //given 
      final test = mk(BalArmCard(getPerMac()));

      //when
      await wt.pumpWidget(test);

      //then
      expect(find.text('bal arm'), findsOneWidget);
      expect(find.text('tot un simp mom'), findsOneWidget);
      expect(find.text('tot weight'), findsOneWidget);

      expect(find.text('='), findsNWidgets(2));
      expect(find.text('/'), findsNWidgets(2));
      expect(find.text('Balance Arm'), findsNWidgets(2));
      expect(find.text('Moment'), findsNWidgets(1));
      expect(find.text('Total Weight'), findsNWidgets(1));
    }
  );
}