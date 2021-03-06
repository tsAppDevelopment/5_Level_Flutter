import 'package:five_level_one/models/nested/cargo.dart';
import 'package:five_level_one/screens/percentmac/validated_cargo_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


Widget mk(Widget child){
  return MaterialApp(home:child);
}

 Cargo getEmpty(){
  return Cargo();
}

Cargo getValid(){
  return Cargo(
    name: 'name',
    weight: 20,
    fs: 1000,
    qty: 2
  );
}

Cargo getValidFromChartC(){
  return Cargo.fromTank(
    name: 'names',
    weight: 25,
    simplemom: 0.7,
    momMultiplier: 10000
  );
}

Cargo getInvalidName(){
  return Cargo(
    name: '',
    weight: 20,
    fs: 1000,
    qty: 2
  );
}

Cargo getInvalidWeightS(){
  return Cargo(
    name: 'name',
    weight: 0,
    fs: 1000,
    qty: 2
  );
}

Cargo getInvalidWeightL(){
  return Cargo(
    name: 'name',
    weight: 2000000,
    fs: 1000,
    qty: 2
  );
}

Cargo getInvalidFSS(){
  return Cargo(
    name: 'name',
    weight: 20,
    fs: 0,
    qty: 2
  );
}

Cargo getInvalidFSL(){
  return Cargo(
    name: 'name',
    weight: 20,
    fs: 100000,
    qty: 2
  );
}

Cargo getInvalidQty(){
  return Cargo(
    name: 'name',
    weight: 20,
    fs: 1000,
    qty: 0
  );
}

List<Cargo> getAllInvalidNWFS(){
  return [
    getInvalidFSL(),
    getInvalidFSS(),
    getInvalidName(),
    getInvalidQty(),
    getInvalidWeightL(),
    getInvalidWeightS(),
  ];
}

List<Cargo> getAllValidNWFS(){
  return [
    getValid(),
    getValidFromChartC(),
  ];
}

///min valid fs
num fs0(){
  return 100;
}

///max valid fs
num fs1(){
  return 10000;
}

num cargoMaxWeight(){
  return 10000;
}

void main(){
       testWidgets(
    'given a validated cargo ui with an invalid nwfs, when drawn, then it will start open',
    (WidgetTester wt) async {

      for(int i=0; i< getAllInvalidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllInvalidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, false);
      expect(state0.ope, true);
      }
    });

     testWidgets(
    'given a validated cargo ui with an invalid nwfs, when drawn, then it is invalid',
    (WidgetTester wt) async {

      for(int i=0; i< getAllInvalidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllInvalidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, false);

      
      }
    });

       testWidgets(
    'given a validated cargo ui with an invalid nwfs, when it is closed, then it is invalid',
    (WidgetTester wt) async {

      for(int i=0; i< getAllInvalidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllInvalidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();
      await wt.tap(find.byKey(Key('tap')));
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, false);
      }
    });

       testWidgets(
    'given a validated cargo ui with a valid nwfs, when drawn , then it will start closed',
    (WidgetTester wt) async {

      for(int i=0; i< getAllValidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllValidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then 
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, true);
      expect(state0.ope, false);
      }
    });

    testWidgets(
    'given a validated cargo ui with a valid nwfs, when opened, then it is valid',
    (WidgetTester wt) async {

      for(int i=0; i< getAllValidNWFS().length;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getAllValidNWFS().elementAt(i),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      //when
      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, true);

      await wt.tap(find.byKey(Key('tap')));
      await wt.pumpAndSettle();

      //then alsoinvalid while open
      ValidatedCargoUIState state1 = wt.state(find.byType(ValidatedCargoUI));
      expect(state1.valid, true);
      }
    });

     testWidgets(
    'given a validated cargo ui with a valid nwfs, when text changed to invalid, then it is invalid',
    (WidgetTester wt) async {

      for(int i=0; i<4;i++){

      //given
      final test = mk(
        ValidatedCargoUI(
          fs0: fs0(),
          fs1: fs1(),
          cargoMaxWeight: cargoMaxWeight(),
          nwf: getValid(),
          onRemovePressed: (i){},
          notifyValid: (i,b){}
        ));

      await wt.pumpWidget(test);
      await wt.pumpAndSettle();

      //init valid 
      ValidatedCargoUIState state0 = wt.state(find.byType(ValidatedCargoUI));
      expect(state0.valid, true);

      //means it starts closed so open it
      await wt.tap(find.byKey(Key('tap')));
      await wt.pumpAndSettle();

      //then
      await wt.enterText(find.byType(TextField).at(i), '');
      await wt.pumpAndSettle();

      //then invalid while closed
      ValidatedCargoUIState state1 = wt.state(find.byType(ValidatedCargoUI));
      expect(state1.valid, false);
      expect(state1.childValid[i], false);

      //if it was not changed it should be valid still
      [0,1,2,3].forEach((j){
        if(j!=i){
        expect(state1.childValid[j], true);
        }
      });
      }

    });


}