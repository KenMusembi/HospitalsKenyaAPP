import 'package:flutter/material.dart';
import 'package:health_spots/hospitals/hopsiptalsList.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
              SizedBox(height: 200),
              Text('Select county to see Hospitals'),
              DropdownButton<String>(
                value: countyDropdown,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 26,
                elevation: 16,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                underline: Container(
                  height: 0,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    countyDropdown = newValue;
                  });
                },
                hint: Text('Select county'),
                items: <String>[
                  'Nairobi',
                  'Kirinyaga',
                  'Bungoma',
                  'Nyamira',
                  'Lamu',
                  'Wajir',
                  'Nandi',
                  'Embu',
                  'Isiolo',
                  'Taita Taveta',
                  'Nakuru',
                  'Migori',
                  'Narok',
                  'Marsabit',
                  'Kilifi',
                  'Kitui',
                  'Mombasa',
                  'Kisumu',
                  'Kakamega',
                  'Machakos',
                  'Mandera',
                  'Meru',
                  'Garissa',
                  'Kisii',
                  'Siaya',
                  'Muranga',
                  'Laikipia',
                  'Kajiado',
                  'Kwale',
                  'Baringo',
                  'Nyeri',
                  'Trans Nzioia',
                  'Vihiga',
                  'Samburu',
                  'Tana Rover',
                  'Elgeyo-Marakwet',
                  'West Pokot',
                  'Makueni',
                  'Kiambu',
                  'Tharaka Nithi',
                  'Turkana',
                  'Busia',
                  'Bomet',
                  'Homa Bay',
                  'Kericho',
                  'Nyandarua',
                  'Uasin Gishu'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            //arguments: {},
            MaterialPageRoute(
                builder: (context) => Hospitals(countyDropdown: countyDropdown)),
          );
        },
        tooltip: 'Search',
        label: Text('Find Hospitals/Clinics'),
        backgroundColor: Colors.red,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future _incrementCounter() async {
  var url = 'http://192.168.43.49:8000/api/v1/hospitals';
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  //print(await http.read('http://192.168.43.49/api/v1/hospitals'));
  return response.body;
}
