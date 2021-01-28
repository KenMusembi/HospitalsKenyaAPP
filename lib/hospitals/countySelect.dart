import 'package:flutter/material.dart';
import 'package:health_spots/hospitals/hospitalsList.dart';
import 'hospitalsClass.dart';

void main() {
  runApp(CountySelect());
}

//Clippers to style the County Select page
class BlueTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 220.0)
      ..quadraticBezierTo(
        size.width / 2.2,
        260.0,
        size.width,
        170.0,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class GreyTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 265.0)
      ..quadraticBezierTo(
        size.width / 2,
        285.0,
        size.width,
        185.0,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WhiteTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 310.0)
      ..quadraticBezierTo(
        size.width / 2,
        310.0,
        size.width,
        200.0,
      )
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CountySelect extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountySelectDropdown(title: 'Hospitals in Kenya'),
    );
  }
}

class CountySelectDropdown extends StatefulWidget {
  CountySelectDropdown({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CountySelectDropdownState createState() => _CountySelectDropdownState();
}

class _CountySelectDropdownState extends State<CountySelectDropdown> {
  String countyDropdown;
  //future object that will hold the data in the for of a List
  Future<List<HospitalClass>> _hospitals;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          children: [
            ClipPath(
              clipper: WhiteTopClipper(),
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            ClipPath(
              clipper: GreyTopClipper(),
              child: Container(
                color: Colors.pink,
              ),
            ),
            ClipPath(
              clipper: BlueTopClipper(),
              child: Container(
                color: Colors.white,
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 300, horizontal: 70),
                child: Column(
                  children: <Widget>[
                    //  Header(),
                    // Spacer(),
                    //LoginForm(),
                    Text(
                      'Select county to see Hospitals',
                      style: TextStyle(color: Colors.black),
                    ),
                    DropdownButton<String>(
                      value: countyDropdown,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      iconSize: 32,
                      elevation: 16,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      underline: Container(
                        height: 1,
                        color: Colors.white,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          countyDropdown = newValue;
                        });
                      },
                      hint: Text(
                        'Select a county',
                        style: TextStyle(color: Colors.black),
                      ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '    Hospitals Kenya',
                            style: TextStyle(
                                color: Colors.black,
                                // letterSpacing: 2.0,
                                fontSize: 26.0,
                                //fontFamily: 'Calibri',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Text(
                      'Find Hospitals within your county, select a county from the dropdown button below.'),
                  //SizedBox(height: 200),
                ],
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          // _incrementCounter(countyDropdown, context);

          Navigator.push(
              context,
              //arguments: {},
              MaterialPageRoute(
                builder: (context) => Hospitals(countyDropdown: countyDropdown),
              ));
        },
        tooltip: 'Click to Find',
        label: Text(
          'Find Hospitals/Clinics',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.pink,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
