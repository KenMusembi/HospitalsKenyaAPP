import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_spots/hospitals/covidData.dart';
import 'package:health_spots/hospitals/feedback.dart';
import 'package:health_spots/main.dart';
import 'package:health_spots/hospitals/map_or_county.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Drawer(
        elevation: 1,
        child: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        DrawerHeader(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: Divider.createBorderSide(context,
                                      color: Colors.transparent, width: 0))),
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: Image.asset(
                                        'images/hospitalslogo.png')),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'locate ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 26.0,
                                  ),
                                ),
                                Text(
                                  'hospitals',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 24.0,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListButtons(
                          onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapCountySelection()),
                                // );
                              );
                            },
                          icon: Icons.location_on,
                          text: 'Map of Hospitals',
                        ),
                        ListButtons(
                        onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CovidHome()),
                                // );
                              );
                            },
                          icon: Icons.sick,
                          text: 'Covid Data',
                        ),
                        ListButtons(
                         onTap: () {
                             
                              launch(
                                  'https://play.google.com/store/apps/details?id=com.nextken.health_spots',
                                  forceSafariVC: false,
                                  forceWebView: false,                                 
                                );
                            },
                          icon: Icons.rate_review,
                          text: 'Rate Us',
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Divider(
                          indent: 30,
                          endIndent: 30,
                          thickness: 1.5,
                          color: Colors.grey.shade200,
                        ),
                        ListButtons(
                          onTap: () {
                            
                           launch(
                                  'https://www.termsfeed.com/live/e678dbb4-020f-4c9e-9b98-9d4674c23fa5',
                                  forceSafariVC: false,
                                  forceWebView: false,
                                  headers: <String, String>{'my_header_key': 'my_header_value'},
                                );

                          },
                          icon: Icons.read_more,
                          text: 'Privacy Policy',
                        ),
                        ListButtons(
                          onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FeedBack()),
                                // );
                              );
                            },
                          icon: Icons.help_outline,
                          text: 'Help and Feedback',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListButtons extends StatelessWidget {
  final String text;
  final icon;
  final onTap;
  ListButtons({this.text, this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 9),
      child: InkWell(
        splashColor: Color(0xffBA6ABC3),
        onTap: onTap,
        focusColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            leading: Icon(
              icon,
              size: 25,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}

class FormItem extends StatelessWidget {
  final String hintText;
  final String helperText;
  final Function onChanged;
  final bool isNumber;
  final IconData icon;
  final controller;

  FormItem(
      {this.hintText,
      this.helperText,
      this.onChanged,
      this.icon,
      this.isNumber: false,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.all(5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffaf5676), style: BorderStyle.solid)),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide:
                  BorderSide(color: Colors.indigo, style: BorderStyle.solid)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                  color: Color(0xffaf5676), style: BorderStyle.solid)),
        ),
        onChanged: (String value) {
          onChanged(value);
        },
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
