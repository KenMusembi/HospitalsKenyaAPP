import 'package:http/http.dart';
import 'dart:convert';

//class for fetching Covid Data

class CovidData {
  String country;
  String flagURL;
  int cases;
  int deaths;
  int recovered;
  Map histData;

  // fetching the data
  void getData(String query) async {
    var url = 'https://corona.lmao.ninja/v2/countries/$query';
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    print(response);
    print('object');
    print(data);

    country = data['country'];
    flagURL = data['countryInfo']['flag'];
    cases = data['cases'];
    deaths = data['deaths'];
    recovered = data['recovered'];
  }

  void getHistData(String query) async {
    var url = 'https://corona.lmao.ninja/v2/historical/$query';
    Response response = await get(url);
    Map data = jsonDecode(response.body);

    histData = data['timeline']['cases'];
  }
}
