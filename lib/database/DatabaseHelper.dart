
import 'package:flutterbirthdayfinderbloc/model/birthday.dart';
import 'package:sqflite/sqflite.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String birthday_table = 'birthday_table';
  String id = 'id';
  String nicNo = 'nic';
  // String birthday = 'birthday';
  // String gender = 'gender';
  String time = 'time';

  DatabaseHelper.createInstance();

  factory DatabaseHelper(){

    if(_databaseHelper == null){
      _databaseHelper = DatabaseHelper.createInstance();
    }
    return _databaseHelper; 
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path+ 'BirthdayFinder.db';

    var birthdayDatabase = await openDatabase(path, version : 1, onCreate: _createDB);
    return birthdayDatabase;

  }

  void _createDB(Database db, int newVersion) async{
    await db.execute(
      'CREATE TABLE $birthday_table($id INTEGER PRIMARY KEY AUTOINCREMENT, $nicNo TEXT, '
      '$time TEXT)');
  }

  //Fetch operation: get all note objects from database
  Future<List<Map<String, dynamic>>> getBirthdayMapList() async {
    Database db = await this.database; //call database
    var result = db.query(birthday_table, orderBy: '$id DESC'); // get data
    return result;
  }

  //Insert operation : Insert a aNote Object and save it to database
  Future<int> insertBirthday(Birthday birthday) async {
    Database db = await this.database; //call database
    var result = await db.insert(birthday_table, birthday.toMap()); // get data
    return result;
  }
  
  Future<int> deleteNote(int id1) async{
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $birthday_table WHERE $id= $id1');
    return result;
  }
  //get the 'Map List' and convert it to note list

  Future<List<Birthday>> getBirthdayList() async{
    var birthdayMapList = await getBirthdayMapList();
    int count = birthdayMapList.length;
    List<Birthday> birthdayList = List<Birthday>();
    //for loop to create a 'Note List' from 'Map List'
    for(int i=0;i< count; i++){
      birthdayList.add(Birthday.fromMapObject(birthdayMapList[i]));
    }

    return birthdayList;
  }




}