import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MapCountySelection());
}

class MapCountySelection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(home: MapCountySelect(title: 'View Map or By Counties'),);
  }

}

class MapCountySelect extends StatefulWidget{
  MapCountySelect({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MapCountySelectState createState() => _MapCountySelectState();
}
 class _MapCountySelectState extends State<MapCountySelect> {
    GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Facilities near you by Maps'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: 
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
    );   
  }
}