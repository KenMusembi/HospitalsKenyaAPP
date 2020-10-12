import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:health_spots/hospitals/hopsiptalsList.dart';
import 'package:fl_chart/fl_chart.dart';

//import 'indicator.dart';

//import 'dart:html' as html;

class HospitalsDetail extends StatefulWidget {
  var county;
  var hospital;
  var services;
  var picture;
  var hospital_designation;
  var email;
  var insurances;
  var payments;
  var phone;

  int touchedIndex;

  HospitalsDetail({
    Key key,
    this.county,
    this.hospital,
    this.services,
    this.email,
    this.hospital_designation,
    this.insurances,
    this.payments,
    this.phone,
    this.picture,
  }) : super(key: key);

  @override
  _HospitalsDetailState createState() => _HospitalsDetailState();
}

class _HospitalsDetailState extends State<HospitalsDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String county = widget.county;
    String hospital = widget.hospital;
    List services = widget.services;
    String phone = widget.phone;
    String email = widget.email;
    String hospital_designation = widget.hospital_designation;
    List insurances = widget.insurances;
    List payments = widget.payments;
    bool animate = true;
    int touchedIndex;

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
                          hospital,
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
                  ],
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Contact Information',
                    style: TextStyle(
                      color: Colors.black,
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
                    color: Colors.black,
                    thickness: 2,
                    height: 2,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 1,
                  //thickness: 2,
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Text(
                      'Email Address: ',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 14.0,
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(email),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      'Phone Number: ',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 14.0,
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(phone),
                  ],
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Insurance Companies',
                    style: TextStyle(
                      color: Colors.black,
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
                    color: Colors.black,
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
                    for (var item in insurances)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item,
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
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Payment Methods',
                    style: TextStyle(
                      color: Colors.black,
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
                    color: Colors.black,
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
                    for (var item in payments)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item,
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
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Mortality Rate',
                    style: TextStyle(
                      color: Colors.black,
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
                    color: Colors.black,
                    thickness: 2,
                    height: 2,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 1,
                  //thickness: 2,
                ),
                AspectRatio(
                  aspectRatio: 1.3,
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                  pieTouchData: PieTouchData(
                                      touchCallback: (pieTouchResponse) {
                                    setState(() {
                                      if (pieTouchResponse.touchInput
                                              is FlLongPressEnd ||
                                          pieTouchResponse.touchInput
                                              is FlPanEnd) {
                                        touchedIndex = -1;
                                      } else {
                                        touchedIndex = pieTouchResponse
                                            .touchedSectionIndex;
                                      }
                                    });
                                  }),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: showingSections()),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Indicator(
                              color: Color(0xff0293ee),
                              text: 'First',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Indicator(
                              color: Color(0xfff8b250),
                              text: 'Second',
                              isSquare: false,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Indicator(
                              color: Color(0xff845bef),
                              text: 'Third',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Indicator(
                              color: Color(0xff13d38e),
                              text: 'Fourth',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Recovery Rate',
                    style: TextStyle(
                      color: Colors.black,
                      //letterSpacing: 2.0,
                      fontSize: 17.0,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(225, 0, 0, 0),
                  child: Divider(
                    color: Colors.black,
                    height: 2,
                    thickness: 2,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 1,
                  //thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                AspectRatio(
                  aspectRatio: 1.66,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.center,
                          barTouchData: BarTouchData(
                            enabled: false,
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                  color: Color(0xff939393), fontSize: 10),
                              margin: 10,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Apr';
                                  case 1:
                                    return 'May';
                                  case 2:
                                    return 'Jun';
                                  case 3:
                                    return 'Jul';
                                  case 4:
                                    return 'Aug';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(
                                  color: Color(
                                    0xff939393,
                                  ),
                                  fontSize: 10),
                              margin: 0,
                            ),
                          ),
                          gridData: FlGridData(
                            show: true,
                            checkToShowHorizontalLine: (value) =>
                                value % 10 == 0,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: const Color(0xffe7e8ec),
                              strokeWidth: 1,
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          groupsSpace: 4,
                          barGroups: getData(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Services ',
                    style: TextStyle(
                      color: Colors.black,
                      //letterSpacing: 2.0,
                      fontSize: 17.0,
                      fontFamily: 'Calibri',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                  child: Divider(
                    color: Colors.black,
                    height: 2,
                    thickness: 2,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 1,
                  //thickness: 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (var item in services)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item,
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
                    SizedBox(
                      height: 10,
                    )
                    //subtitle: Text('Maternity'),
                    /* Text(
                      'Available',
                      style: TextStyle(
                        color: Colors.green,
                        //letterSpacing: 2.0,
                        fontSize: 15.0,
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w500,
                      ),
                    ),*/
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
              Navigator.pop(context);
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
          FlatButton.icon(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            //color: Colors.white,
            //elevation: 2.0,
            onPressed: () {
              _exitApp(context);
            },
            icon: Icon(Icons.exit_to_app, color: Colors.blue[600]),
            label: Text(
              'Exit',
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

List<PieChartSectionData> showingSections() {
  int touchedIndex;
  return List.generate(4, (i) {
    final isTouched = i == touchedIndex;
    final double fontSize = isTouched ? 25 : 16;
    final double radius = isTouched ? 60 : 50;
    switch (i) {
      case 0:
        return PieChartSectionData(
          color: const Color(0xff0293ee),
          value: 50,
          title: '50%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 1:
        return PieChartSectionData(
          color: const Color(0xfff8b250),
          value: 10,
          title: '10%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 2:
        return PieChartSectionData(
          color: const Color(0xff845bef),
          value: 20,
          title: '20%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      case 3:
        return PieChartSectionData(
          color: const Color(0xff13d38e),
          value: 20,
          title: '20%',
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        );
      default:
        return null;
    }
  });
}

List<BarChartGroupData> getData() {
  Color normal = Colors.orange;
  Color dark = Colors.black;
  Color light = Colors.blue;
  return [
    BarChartGroupData(
      x: 0,
      barsSpace: 4,
      barRods: [
        BarChartRodData(
            y: 17,
            rodStackItems: [
              BarChartRodStackItem(0, 2, dark),
              BarChartRodStackItem(2, 12, normal),
              BarChartRodStackItem(12, 17, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 24,
            rodStackItems: [
              BarChartRodStackItem(0, 13, dark),
              BarChartRodStackItem(13, 14, normal),
              BarChartRodStackItem(14, 24, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 23.5,
            rodStackItems: [
              BarChartRodStackItem(0, 6.5, dark),
              BarChartRodStackItem(6.5, 18, normal),
              BarChartRodStackItem(18, 23.5, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 29,
            rodStackItems: [
              BarChartRodStackItem(0, 9, dark),
              BarChartRodStackItem(9, 15, normal),
              BarChartRodStackItem(15, 29, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 32,
            rodStackItems: [
              BarChartRodStackItem(0, 2.5, dark),
              BarChartRodStackItem(2.5, 17.5, normal),
              BarChartRodStackItem(17.5, 32, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
      ],
    ),
    BarChartGroupData(
      x: 1,
      barsSpace: 4,
      barRods: [
        BarChartRodData(
            y: 31,
            rodStackItems: [
              BarChartRodStackItem(0, 11, dark),
              BarChartRodStackItem(11, 18, normal),
              BarChartRodStackItem(18, 31, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 35,
            rodStackItems: [
              BarChartRodStackItem(0, 14, dark),
              BarChartRodStackItem(14, 27, normal),
              BarChartRodStackItem(27, 35, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 31,
            rodStackItems: [
              BarChartRodStackItem(0, 8, dark),
              BarChartRodStackItem(8, 24, normal),
              BarChartRodStackItem(24, 31, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 6.5, dark),
              BarChartRodStackItem(6.5, 12.5, normal),
              BarChartRodStackItem(12.5, 15, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 17,
            rodStackItems: [
              BarChartRodStackItem(0, 9, dark),
              BarChartRodStackItem(9, 15, normal),
              BarChartRodStackItem(15, 17, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barsSpace: 4,
      barRods: [
        BarChartRodData(
            y: 34,
            rodStackItems: [
              BarChartRodStackItem(0, 6, dark),
              BarChartRodStackItem(6, 23, normal),
              BarChartRodStackItem(23, 34, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 32,
            rodStackItems: [
              BarChartRodStackItem(0, 7, dark),
              BarChartRodStackItem(7, 24, normal),
              BarChartRodStackItem(24, 32, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 14.5,
            rodStackItems: [
              BarChartRodStackItem(0, 1.5, dark),
              BarChartRodStackItem(1.5, 12, normal),
              BarChartRodStackItem(12, 14.5, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 20,
            rodStackItems: [
              BarChartRodStackItem(0, 4, dark),
              BarChartRodStackItem(4, 15, normal),
              BarChartRodStackItem(15, 20, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 24,
            rodStackItems: [
              BarChartRodStackItem(0, 4, dark),
              BarChartRodStackItem(4, 15, normal),
              BarChartRodStackItem(15, 24, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barsSpace: 4,
      barRods: [
        BarChartRodData(
            y: 14,
            rodStackItems: [
              BarChartRodStackItem(0, 1.5, dark),
              BarChartRodStackItem(1.5, 12, normal),
              BarChartRodStackItem(12, 14, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 27,
            rodStackItems: [
              BarChartRodStackItem(0, 7, dark),
              BarChartRodStackItem(7, 25, normal),
              BarChartRodStackItem(25, 27, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 29,
            rodStackItems: [
              BarChartRodStackItem(0, 6, dark),
              BarChartRodStackItem(6, 23, normal),
              BarChartRodStackItem(23, 29, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 16.5,
            rodStackItems: [
              BarChartRodStackItem(0, 9, dark),
              BarChartRodStackItem(9, 15, normal),
              BarChartRodStackItem(15, 16.5, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
        BarChartRodData(
            y: 15,
            rodStackItems: [
              BarChartRodStackItem(0, 7, dark),
              BarChartRodStackItem(7, 12.5, normal),
              BarChartRodStackItem(12.5, 15, light),
            ],
            borderRadius: const BorderRadius.all(Radius.zero)),
      ],
    ),
  ];
}

Future<bool> _exitApp(BuildContext context) {
  return showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Logout from Jitenge.'),
          content: Text('Are you sure you want to log out?'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.white)),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  //arguments: {},
                  MaterialPageRoute(builder: (context) => Hospitals()),
                  (Route<dynamic> route) => false,
                );
                //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}
