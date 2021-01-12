import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'hospitalDetails.dart';
import 'dart:convert';
import 'dart:async';
import 'hospitalsClass.dart';

void main() {
  runApp(Hospitals());
}

class Hospitals extends StatefulWidget {
  final dynamic county,
      countyDropdown,
      hospital,
      picture,
      hospital_designation,
      phone,
      email;
  List services, payments, insurances;
  @override
  Hospitals(
      {Key key,
      this.county,
      this.countyDropdown,
      this.hospital,
      this.picture,
      this.hospital_designation,
      this.email,
      this.insurances,
      this.payments,
      this.phone,
      this.services})
      : super(key: key);
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  Future<List<HospitalClass>> _hospitals;
  String searchString = "";

  final TextEditingController editingController = new TextEditingController();

  void initState() {
    String countyDropdown = widget.countyDropdown;
    _hospitals = _incrementCounter(countyDropdown, context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String countyDropdown = widget.countyDropdown;

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
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 70),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        'Facilities in $countyDropdown County',
                        style: TextStyle(
                          color: Colors.black,
                          //letterSpacing: 2.0,
                          fontSize: 20.0,
                          fontFamily: 'Calibri',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      alignment: Alignment.center,
                      height: 55,
                      decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          border: new Border.all(
                            color: Colors.grey[300],
                            width: 1.0,
                          ),
                          borderRadius: new BorderRadius.circular(8.0)),
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        cursorColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            searchString = value;
                          });
                        },
                        controller: editingController,
                        decoration: InputDecoration(
                          //fillColor: Colors.grey,
                          //filled: true,
                          border: InputBorder.none,
                          labelText: "Search for a Hospital or Clinic here",
                          prefixIcon: Icon(
                            Icons.search,
                            // color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: new FutureBuilder<List<HospitalClass>>(
                          future: _hospitals,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<HospitalClass> yourPosts = snapshot.data;
                              return new ListView.builder(
                                  itemCount: yourPosts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    // Whatever sort of things you want to build
                                    // with your Post object at yourPosts[index]:

                                    if (yourPosts[index].county ==
                                        '$countyDropdown') {
                                      return yourPosts[index]
                                              .name
                                              .contains(searchString)
                                          ? Card(
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    enabled: true,
                                                    //  isThreeLine: true,
                                                    onTap: () {
                                                      updateTime(
                                                          index, yourPosts);
                                                    },

                                                    title: Text(yourPosts[index]
                                                        .name
                                                        .toString()),
                                                    subtitle: Text(
                                                        yourPosts[index]
                                                            .kephLevel
                                                            .toString()),
                                                    //trailing: Text(hh[index].toString()),
                                                  ),

                                                  // ),
                                                  // Text(resources[index].heading)
                                                ],
                                              ),
                                            )
                                          : Container();
                                    }
                                  });
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            // By default, show a loading spinner.

                            return CircularProgressIndicator();
                          }),

                      //],
                    ),
                  ],
                ),
              ),
              //  Text('${_hospitals.toString()}'),
              // Text('$countyDropdown'),
              //Text('${hh['success']}'),
              //Text('${hh['message']}'),
              //Text('${hh['driver']['last_name']}'),
              //for (var word in hh.keys.toString().split("{ }")) Text(word),
              // var textSpanList = text.split(" ").map((word) => TextSpan(text: word)).toList();

              /* Flexible(
                child: new ListView.builder(
                    itemCount: autoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // Whatever sort of things you want to build
                      // with your Post object at yourPosts[index]:
                      return ListTile(
                          title: Text(autoList[index]),
                          subtitle: Text(autoList[index]),
                          onTap: () => {});
                    }),
              ),
              */
              //],
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Search',
        backgroundColor: Colors.pink,
        label: Text('Choose Another County'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void updateTime(index, yourPosts) async {
    //imageCache.clear();

    HospitalClass instance = yourPosts[index];

    // navigate to home screen and pass any data as well, eg location, flag
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HospitalsDetail(
                county: instance.county,
                hospital: instance.name,
                owner: instance.owner,
                open24hrs: instance.openWholeDay,
                openholidays: instance.openPublicHolidays,
                hospital_designation: instance.kephLevel,
                email: instance.hospitalEmail,
                openweekends: instance.openWeekends,
                openlatenight: instance.openLateNight,
                phone: instance.hospitalPhoneNumber,
                beds: instance.beds,
                cots: instance.cots,
              )),
      // );
    );
  }
}

Future<List<HospitalClass>> _incrementCounter(countyDropdown, context) async {
  var url =
      'https://thestratizen.co.ke/laravel/api/v1/hospitals?County=$countyDropdown';
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');

  // print('Response body: $responseString');

  //print(await http.read('http://192.168.43.49/api/v1/hospitals'));
  return List<HospitalClass>.from(
      json.decode(response.body).map((x) => HospitalClass.fromJson(x)));
}
