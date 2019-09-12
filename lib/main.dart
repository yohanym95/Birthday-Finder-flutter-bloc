import 'package:flutter/material.dart';
import 'package:flutterbirthdayfinderbloc/Pages/HistoryPage.dart';
import 'package:flutterbirthdayfinderbloc/Pages/HomePage.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birthday Finder',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Birthday Finder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HisotryPage();
              }));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(
                "Birthday Finder",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.perm_identity,
                  size: 50,
                ),
                backgroundColor: Colors.white,
              ),
              accountEmail: null,
            ),
            new ListTile(
              title: Text("Share"),
              trailing: Icon(
                Icons.share,
                color: Colors.teal,
              ),
            ),
            GestureDetector(
              child: new ListTile(
                title: Text("About"),
                trailing: Icon(
                  Icons.person,
                  color: Colors.teal,
                ),
              ),onTap: (){
                 _launchURL();
              },

            ),
            new ListTile(
              title: Text("Rate this App"),
              trailing: Icon(
                Icons.rate_review,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
      body: HomePage(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.camera_alt),
      //   onPressed: (){
      //     print("Click the camera button");
      //   },
      // ),
    );
  }

  _launchURL()  {
    const url = 'https://yohanym95.github.io/';
    if ( canLaunch(url) != null) {
       launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
