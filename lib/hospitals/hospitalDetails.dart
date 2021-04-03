import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:health_spots/main.dart';

//import 'indicator.dart';

//import 'dart:html' as html;

class HospitalsDetail extends StatefulWidget {
  var county,
      hospital,
      owner,
      open24hrs,
      hospital_designation,
      email,
      openweekends,
      openlatenight,
      openholidays,
      phone,
      beds,
      cots;

  int touchedIndex;

  HospitalsDetail({
    Key key,
    this.county,
    this.hospital,
    this.owner,
    this.email,
    this.hospital_designation,
    this.openweekends,
    this.open24hrs,
    this.openholidays,
    this.phone,
    this.openlatenight,
    this.beds,
    this.cots,
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
    dynamic owner = widget.owner;
    String phone = widget.phone;
    String email = widget.email;
    String hospital_designation = widget.hospital_designation;
    dynamic open24hrs = widget.open24hrs;
    dynamic openlatenight = widget.openlatenight,
        openweekends = widget.openweekends,
        openholidays = widget.openholidays,
        beds = widget.beds,
        cots = widget.cots;
    bool animate = true;
    int touchedIndex;

    //set background
    //String bgImage = '$picture' != null ? '$picture' : 'jitenge.png';
    // Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          hospital,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$hospital_designation' + ' Hospital',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 17.0,
                      fontFamily: 'Calibri',
                      //  fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$owner',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 17.0,
                      fontFamily: 'Calibri',
                      //  fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'In-Patient Capacity',
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
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Text(
                      'Beds: ',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 14.0,
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(beds),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      'Cots: ',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 14.0,
                        fontFamily: 'Calibri',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(cots),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Contact Information',
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
                    'Open Weekends',
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
                    // for (var item in insurances)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$openweekends',
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
                    'Open Night Time',
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
                        '$openlatenight',
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
                    'Open Holidays',
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
                        '$openholidays',
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

                /*   Align(
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
               */
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Open 24 Hrs ',
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
                  padding: const EdgeInsets.fromLTRB(250, 0, 0, 0),
                  child: Divider(
                    color: Colors.blue[600],
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
                    //    for (var item in services)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$open24hrs',
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
              Navigator.push(
                context,
                //arguments: {},
                MaterialPageRoute(builder: (context) => MyApp()),
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
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(' Exit'),
              content: Text('Are you sure you want to exit?'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.white)),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  child: Text('Yes'),
                ),
              ],
            );
          }) ??
      false;
}
