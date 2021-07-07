import 'package:flutter/material.dart';
import 'package:health_spots/hospitals/hospitalsList.dart';
import '../models/hospitalsClass.dart';

void main() {
  runApp(CountySelect());
}

//Clippers to style the County Select page
class BlueTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 180.0)
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
    return 
       CountySelectDropdown(title: 'Hospitals in Kenya');
    
  }
}

class CountySelectDropdown extends StatefulWidget {
  CountySelectDropdown({Key key, this.title}) : super(key: key);
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hospitals Kenya'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.pop(context);
            Navigator.of(context, rootNavigator: true).maybePop();
          },
        ),
      ),
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
                color: Colors.blue,
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

                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: DropdownButton<String>(
                        value: countyDropdown,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        iconSize: 32,
                        elevation: 16,
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                  'Find Hospitals within your county, select a county from the dropdown button below.'),
              //SizedBox(height: 200),
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
        backgroundColor: Colors.blue,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
