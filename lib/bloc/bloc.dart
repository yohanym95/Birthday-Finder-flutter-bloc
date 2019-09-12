import 'dart:async';
import 'package:flutterbirthdayfinderbloc/logic/Validator.dart';
import 'package:rxdart/rxdart.dart';


class Bloc extends Object with Validator implements BaseBloc{
  // Birthday birthday = Birthday('','');
  final nicNoContoller = BehaviorSubject<String>();


  Function(String) get nicNoChanged => nicNoContoller.sink.add;
  Stream<int> get nicNoStream => nicNoContoller.stream.transform(noValidator);
  Stream<int> get nicNoStream1 => nicNoContoller.stream.transform(noValidator1);


  Stream<bool> get submitCheck => Observable.combineLatest2(nicNoStream, nicNoStream1, (e,p)=>true);


  

 

  // Stream<bool> submit(Stream<String> stream){

  //   return ;
  // }


  @override
  void dispose() {
    nicNoContoller?.close();
    
  }


}

abstract class BaseBloc{
  void dispose();
}