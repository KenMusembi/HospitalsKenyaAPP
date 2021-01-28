import 'package:flutter/material.dart';
import 'package:health_spots/hospitals/countySelect.dart';
import 'package:health_spots/hospitals/covidData.dart';
import 'package:health_spots/hospitals/feedback.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Hospitals in Kenya'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String countyDropdown;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                'Hospitals Kenya',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontFamily: 'Calibri',
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Browse hospitals under your county.',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.5,
                  fontSize: 14.0,
                  // fontFamily: 'Calibri',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: 500,
                  // height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.greenAccent,
                    elevation: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          leading: Icon(
                            Icons.local_hospital,
                            size: 70,
                            //color: Colors.white,
                          ),
                          title: Text('Hospitals and Clinics',
                              style: TextStyle(color: Colors.black, height: 2)),
                          subtitle: Text('browse facilities and services \n \n',
                              style: TextStyle(color: Colors.black, height: 2)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CountySelect()),
                              // );
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  width: 500,
                  //height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.blueAccent,
                    elevation: 15,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          leading: Icon(
                            Icons.dashboard,
                            size: 70,
                            // color: Colors.black,
                          ),
                          title: Text('Covid 19 Data ',
                              style: TextStyle(color: Colors.white, height: 2)),
                          subtitle: Text('View Covid 19 Cases \n \n',
                              style: TextStyle(color: Colors.white, height: 2)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CovidHome()),
                              // );
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  width: 500,
                  // height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.red,
                    elevation: 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          leading: Icon(
                            Icons.note,
                            size: 70,
                            //  color: Colors.white,
                          ),
                          title: Text('Fedback',
                              style: TextStyle(color: Colors.white, height: 2)),
                          subtitle: Text('give your feedback on the app \n \n',
                              style: TextStyle(color: Colors.white, height: 2)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedBack()),
                              // );
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  width: 500,
                  //  height: 120,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.deepOrange[300],
                    elevation: 15,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new ListTile(
                          leading: Icon(
                            Icons.star,
                            size: 70,
                            // color: Colors.black,
                          ),
                          title: Text('Rate Us ',
                              style: TextStyle(color: Colors.white, height: 2)),
                          subtitle: Text('rate us on playstore \n \n',
                              style: TextStyle(color: Colors.white, height: 2)),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//future function to return all the hospitals
Future _incrementCounter() async {
  var url = 'https://thestratizen.co.ke/laravel/api/v1/hospitals';
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  //print(await http.read('http://192.168.43.49/api/v1/hospitals'));
  return response.body;
}
