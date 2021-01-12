import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class FeedBack extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

void main() => runApp(MaterialApp(
      home: FeedBack(),
    ));

class _FeedbackState extends State<FeedBack> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String email, phone;

    //set background
    //String bgImage = '$picture' != null ? '$picture' : 'jitenge.png';
    // Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Feedback',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontSize: 18.0,
                            fontFamily: 'Calibri',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.black),
                      onPressed: () {
                        _exitApp(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Email:',
                    style: TextStyle(
                      color: Colors.blue[600],
                      //letterSpacing: 2.0,
                      fontSize: 17.0,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(226, 0, 0, 0),
                  child: Divider(
                    color: Colors.blue[600],
                    thickness: 2,
                    height: 2,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 1,
                  //thickness: 2,
                ),
                SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // for (var item in payments)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'kenmusembi21@gmail.com',
                        style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 14.0,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    //subtitle: Text('Maternity'),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.blue[600],
                      //letterSpacing: 2.0,
                      fontSize: 17.0,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(226, 0, 0, 0),
                  child: Divider(
                    color: Colors.blue[600],
                    thickness: 2,
                    height: 2,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 1,
                  //thickness: 2,
                ),
                SizedBox(height: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // for (var item in payments)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '0748050434',
                        style: TextStyle(
                          height: 2,
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 14.0,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    //subtitle: Text('Maternity'),
                  ],
                ),
              ],
            ),
          ),
          //
        ]),
      ),
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton.icon(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            //color: Colors.white,
            //elevation: 2.0,
            onPressed: () {
              Navigator.push(
                context,
                //arguments: {},
                MaterialPageRoute(builder: (context) => FeedBack()),
                // (Route<dynamic> route) => false,
              );
              //SystemCha
            },
            icon: Icon(Icons.home, color: Colors.blue[600]),
            label: Text(
              'Home',
              style: TextStyle(
                  color: Colors.blue[600],
                  //letterSpacing: 2.0,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          FlatButton.icon(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            //color: Colors.white,
            //elevation: 2.0,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.assignment, color: Colors.blue[600]),
            label: Text(
              'Hospitals',
              style: TextStyle(
                  color: Colors.blue[400],
                  //letterSpacing: 2.0,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}

Future<bool> _exitApp(BuildContext context) {
  return showDialog(
        context: context,
        child: AlertDialog(
          title: Text(' Exit'),
          content: Text('Are you sure you want to exit?'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.white)),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}
