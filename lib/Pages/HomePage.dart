import 'package:flutter/material.dart';
import 'package:flutterbirthdayfinderbloc/bloc/BlocDatabase.dart';
import 'package:flutterbirthdayfinderbloc/bloc/bloc.dart';
import 'package:flutterbirthdayfinderbloc/database/DatabaseHelper.dart';
import 'package:flutterbirthdayfinderbloc/logic/finderLogic.dart';
import 'package:flutterbirthdayfinderbloc/model/birthday.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper helper = DatabaseHelper();
  Birthday birthday1 = Birthday('', '');
  BlocDatabase blocDatabase = BlocDatabase();

  foundBirthday(int idNo, String birthday) async {
    // birthday1.nic = idNo.toString() + "v";
    // birthday1.time = DateFormat("dd-MM-yyyy").format(DateTime.now());

    int result;
    result = await blocDatabase.addBirthday(birthday1);

    if (result != 0) {
      print("Id No : $idNo" + "v");
      print("Bithday : $birthday");
      // print("Id No : ${birthday1.nic}" + "v");
      // print("Bithday : $birthday");
    } else {
      print('Problem of saving birthday');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Bloc();
    final finder = BirthdayFinder();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 80.0),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            StreamBuilder<int>(
                stream: bloc.nicNoStream,
                builder: (context, snapshot) {
                  return TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter NIC No",
                      labelText: "NIC No",
                      errorText: snapshot.error,
                    ),
                    onChanged: bloc.nicNoChanged,
                  );
                }),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<int>(
                stream: bloc.nicNoStream,
                builder: (context, snapshot) {
                  return MaterialButton(
                    color: Colors.teal,
                    // onPressed: snapshot.hasData ? () =>changedPage(context) : null,
                    child: Text(
                      "Find",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: snapshot.hasData
                        ? () => foundBirthday(
                            snapshot.data, finder.finder(snapshot.data))
                        : null,
                  );
                })
          ],
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () {
          print("Click the camera button");
        },
      ),
    );
  }
}
