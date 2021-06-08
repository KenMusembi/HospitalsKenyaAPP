import 'package:flutter/material.dart';
import 'package:health_spots/hospitals/countySelect.dart';
import 'package:health_spots/hospitals/covidData.dart';
import 'package:health_spots/hospitals/feedback.dart';
import 'package:health_spots/hospitals/hospitalsList.dart';
import 'package:health_spots/hospitals/map_or_county.dart';
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
    String whiteColor = "#F9F9F9";
    String greenColor = "#00e04f";
    List<Color> _colors = [HexColor('#9DD1F9'), HexColor('#9DD1F9')];
    List<double> _stops = [0.0, 1.0];
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hospitals Kenya"),
      ),
      body: Stack(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                  height: 10,
                ),
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blue[200],
                      elevation: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new ListTile(
                            leading: Icon(
                              Icons.place,
                              size: 70,
                              //  color: Colors.white,
                            ),
                           title: Text('Map of Hospitals near you',
                              style: TextStyle(color: Colors.black, height: 2)),
                          subtitle: Text('See map of hospitals near you \n \n',
                              style: TextStyle(color: Colors.black, height: 2)),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapCountySelection()),
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
                    width: MediaQuery.of(context).size.width,
                    //height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.lightBlue[400],
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
                                style:
                                    TextStyle(color: Colors.white, height: 2)),
                            subtitle: Text('View Covid 19 Cases \n \n',
                                style:
                                    TextStyle(color: Colors.white, height: 2)),
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
                    width: MediaQuery.of(context).size.width,
                    //  height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blue[400],
                      elevation: 15,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new ListTile(
                            leading: Icon(
                              Icons.local_hospital,
                              size: 70,
                              // color: Colors.black,
                            ),
                            title: Text('Hospitals By County',
                                style:
                                    TextStyle(color: Colors.white, height: 2)),
                            subtitle: Text('Browse facilities by county \n \n',
                                style:
                                    TextStyle(color: Colors.white, height: 2)),
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
                    width: MediaQuery.of(context).size.width,
                    // height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blue,
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
                                style:
                                    TextStyle(color: Colors.white, height: 2)),
                            subtitle: Text(
                                'Give your feedback on the app \n \n',
                                style:
                                    TextStyle(color: Colors.white, height: 2)),
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
              ],
            ),
          ),
        ],
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
