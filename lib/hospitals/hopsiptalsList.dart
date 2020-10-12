import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'hospitalDetails.dart';
import 'dart:convert';
import 'dart:async';

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
  String countyDropdown;
  bool searched = false;
  Hospitals hospital;

  final TextEditingController editingController = new TextEditingController();
  List<Hospitals> autoList = [
    Hospitals(
      county: "Nairobi",
      hospital: 'The Kenyatta National Hospital Level 5 ',
      hospital_designation: 'Public',
      picture:
          'https://images.unsplash.com/photo-1538108149393-fbbd81895907?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      services: ['Surgery', 'Optical'],
      payments: ['Bank', 'Mpesa'],
      insurances: ['Jubilee', 'Armco'],
      phone: '0748050434',
      email: 'kenmusembi21@gmail.com',
    ),
    Hospitals(
      county: "Machakos",
      hospital: 'Arm Medical',
      hospital_designation: 'Private',
      picture:
          'https://images.unsplash.com/photo-1551076805-e1869033e561?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      services: ['Optical'],
      payments: ['Bank', 'Mpesa'],
      insurances: ['Jubilee', 'Armco'],
      phone: '0748050434',
      email: 'kenmusembi21@gmail.com',
    ),
    Hospitals(
      county: "Embu",
      hospital: 'Medical Clinic',
      hospital_designation: 'Public',
      picture:
          'https://images.unsplash.com/photo-1551076805-e1869033e561?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
      services: ['Maternity', 'Dental', 'Covid 19 Testing'],
      payments: ['Bank', 'Mpesa'],
      insurances: ['Jubilee', 'Armco'],
      phone: '0748050434',
      email: 'kenmusembi21@gmail.com',
    )
  ];
  List<dynamic> filteredList = [];
  void initState() {
    filteredList.addAll(autoList);
  }

  @override
  Widget build(BuildContext context) {
    String county = widget.county;
    String hospital = widget.hospital;
    String picture = widget.picture;
    String hospital_designation = widget.hospital_designation;
    String countyDropdown = widget.countyDropdown;
    var textSpanList;
    Map<String, dynamic> hh = {
      "success": true,
      "message": "Driver Details Found",
      "driver": {
        "first_name": "MOHAMED",
        "last_name": "ARUMII SHEE",
        "contact_uuid": "79078739-D87C-716C-305352B6D3A810E5",
        "sex": "Male",
        "passport_number": "10391254",
        "driver_national_id": "10391254",
        "phone_number": "+254713018585",
        "dob": "2020-08-28",
        "source": "RECDTS",
        "nationality": "Kenyan"
      }
    };

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
                        'Facilities in $county County',
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
                            filteredList
                                .clear(); //for the next time that we search we want the list to be unfilterted
                            filteredList.addAll(
                                autoList); //getting list to original state

//removing items that do not contain the entered Text
                            filteredList.removeWhere(
                                (i) => i.contains(value.toString()) == false);

//following is just a bool parameter to keep track of lists
                            searched = !searched;
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
                      child: new ListView.builder(
                          itemCount: filteredList.length,
                          itemBuilder: (BuildContext context, int index) {
                            // Whatever sort of things you want to build
                            // with your Post object at yourPosts[index]:
                            if (filteredList[index].county == countyDropdown) {
                              return Card(
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Image.network(
                                        '${filteredList[index].picture}',
                                        height: 75,
                                        width: 100,
                                        //color: Colors.white,
                                        fit: BoxFit.contain,
                                      ),
                                      enabled: true,
                                      //  isThreeLine: true,
                                      onTap: () {
                                        updateTime(index);
                                      },

                                      title: Text(filteredList[index]
                                          .hospital
                                          .toString()),
                                      subtitle: Text(filteredList[index]
                                          .hospital_designation
                                          .toString()),
                                      //trailing: Text(hh[index].toString()),
                                    ),

                                    // ),
                                    // Text(resources[index].heading)
                                  ],
                                ),
                              );
                            } else {
                              return Card(
                                child: Column(
                                  children: [
                                    //Text('No Facilities in this county'),

                                    // ),
                                    // Text(resources[index].heading)
                                  ],
                                ),
                              );
                            }
                          }),

                      //],
                    ),
                  ],
                ),
              ),
              Text('${hh['success']}'),
              Text('${hh['message']}'),
              Text('${hh['driver']['last_name']}'),
              for (var word in hh.keys.toString().split("{ }")) Text(word),
              // var textSpanList = text.split(" ").map((word) => TextSpan(text: word)).toList();
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: hh.values.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: hh[index],
                      subtitle: hh[index],
                    );
                  }),

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
        backgroundColor: Colors.red,
        label: Text('Choose Another County'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void updateTime(index) async {
    imageCache.clear();
    setState(() {
      //hospital = filteredList[index];
    });
    Hospitals instance = filteredList[index];
    //await instance.getResource();
    // navigate to home screen and pass any data as well, eg location, flag
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HospitalsDetail(
                county: instance.county,
                hospital: instance.hospital,
                services: instance.services,
                picture: instance.picture,
                hospital_designation: instance.hospital_designation,
                email: instance.email,
                insurances: instance.insurances,
                payments: instance.payments,
                phone: instance.phone,
              )),
      // );
    );
  }
}
