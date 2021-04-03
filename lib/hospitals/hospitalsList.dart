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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Facilities in $countyDropdown County',
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                          labelText:
                              "Search for a facility in $countyDropdown here",
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Search',
        backgroundColor: Colors.blue,
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

//future method to fetch hospitals according to country selected
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
