import 'package:flutterbirthdayfinderbloc/model/birthday.dart';
import 'package:flutterbirthdayfinderbloc/database/DatabaseHelper.dart';

class BirthdayRepo{

  final birthdayDatabase = DatabaseHelper();

  Future <List<Birthday>> getallBirthday() =>birthdayDatabase.getBirthdayList();

  Future insertBirthday(Birthday birthday) => birthdayDatabase.insertBirthday(birthday);

  Future deleteBirthday(int id) => birthdayDatabase.deleteNote(id);


}