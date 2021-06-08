import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MapCountySelection());
}

//this stateless widget has immutable state
class MapCountySelection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(home: MapCountySelect(title: 'View Map or By Counties'),);
  }
}

//has mutable state
class MapCountySelect extends StatefulWidget{
  MapCountySelect({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MapCountySelectState createState() => _MapCountySelectState();
}
 class _MapCountySelectState extends State<MapCountySelect> {
    GoogleMapController mapController;

  //set a constant latitude and longitude
  final LatLng _center = const LatLng(-1.2996871018096856, 36.807450345658594);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  Set<Marker> _createMarker() {
  return {
    Marker(
        markerId: MarkerId("marker_1"),
        position: _center,
        infoWindow: InfoWindow(title: 'Marker 1'),
        rotation: 90),
    // Marker(
    //   markerId: MarkerId("marker_2"),
    //   position: LatLng(-1.2996871018096856, 36.807450345658594),
    // ),
  };
}
  //added map functionality
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Map of Facilities near you.'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: 
      //GoogleMap widget displaying googlemaps activity
        GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
        //  onMapCreated: _onMapCreated,
        markers: _createMarker(),
        //trafficEnabled: true,
        mapType: MapType.satellite,
          initialCameraPosition: CameraPosition(
            //target is where the map should focus or show
            target: _center,
            //define the zoom ratio
            zoom: 11.0,
          ),
        ),
    );   
  }
}