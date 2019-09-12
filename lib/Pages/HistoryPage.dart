import 'package:flutter/material.dart';
import 'package:flutterbirthdayfinderbloc/bloc/BlocDatabase.dart';
import 'package:flutterbirthdayfinderbloc/bloc/bloc.dart';
import 'package:flutterbirthdayfinderbloc/database/DatabaseHelper.dart';
import 'package:flutterbirthdayfinderbloc/model/birthday.dart';
import 'package:sqflite/sqflite.dart';

class HisotryPage extends StatefulWidget {
  @override
  _HisotryPageState createState() => _HisotryPageState();
}

class _HisotryPageState extends State<HisotryPage> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  Bloc bloc = Bloc();
  BlocDatabase blocDatabase = BlocDatabase();

  // List<Birthday> birthdayList;
  var count;
  @override
  Widget build(BuildContext context) {
    // if (birthdayList == null) {
    //   birthdayList = List<Birthday>();

    //   // updateListView();
    // }
    blocDatabase.getbirthday();
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),

      body: getBirthdayListView(),
      backgroundColor: Colors.teal[50],
    );
  }

  StreamBuilder getBirthdayListView(){

    return StreamBuilder<List<Birthday>>(
      stream: blocDatabase.birthday,
      builder: (context, snapshot) {
        return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context,int position){
                return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    title: Text(snapshot.data[position].nic),
                    subtitle: Text(snapshot.data[position].time),
                    trailing: GestureDetector(
                      child: Icon(Icons.delete,color:Colors.grey),
                      onTap: (){
                        // _delete(context, snapshot.data);
                        blocDatabase.deleteBirthday(snapshot.data[position].id);
                      },
                    ),
                  ),
                );
              },
            );
      }
    );
  }

  // void _delete(BuildContext context, Birthday birthday) async{
  //   int result = await databaseHelper.deleteNote(birthday.id);
  //   if(result != 0){
  //     print('Note Deleted Successfully');
  //     updateListView();
  //   }

  // }


  // void updateListView(){
  //   final Future<Database> dbFuture = databaseHelper.initializeDatabase();
  //   dbFuture.then((database) {
  //     Future<List<Birthday>> birthdayListFuture = databaseHelper.getBirthdayList();
  //     birthdayListFuture.then((birthdayList1){
  //       setState(() {
  //        this.birthdayList = birthdayList1;
  //        this.count = birthdayList1.length;
  //       });
  //     });
  //   });
  // }
}

