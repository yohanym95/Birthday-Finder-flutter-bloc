import 'dart:async';
import 'package:flutterbirthdayfinderbloc/logic/birthday_repo.dart';
import 'package:flutterbirthdayfinderbloc/model/birthday.dart';

class BlocDatabase implements BaseBloc{
  final birthdayRepo = BirthdayRepo();

  final birthdayController = StreamController<List<Birthday>>.broadcast();

  get birthday => birthdayController.stream;


  BlocDatabase(){
    getbirthday();
  }

 getbirthday() async{
    birthdayController.sink.add(await birthdayRepo.getallBirthday());
  }

  addBirthday(Birthday birthday) async{
    await birthdayRepo.insertBirthday(birthday);
    getbirthday();
  }

  deleteBirthday(int id) async{
    birthdayRepo.deleteBirthday(id);
    getbirthday();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    birthdayController.close();
  }

  

  
}


abstract class BaseBloc{
  void dispose();
}