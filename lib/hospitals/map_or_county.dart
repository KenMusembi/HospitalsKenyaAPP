import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

void main() {
  runApp(MapCountySelection());
}
//constants to be used in the Map widget
const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION = LatLng(-1.2996871018096856, 36.807450345658594);
const LatLng DEST_LOCATION = LatLng(-1.30441216368926, 36.82477711537236);


//this stateless widget has immutable state
class MapCountySelection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MapCountySelect(title: 'View Map or By Counties');
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
    //GoogleMapController mapController;
    Completer<GoogleMapController> _controller = Completer();

  //set a constant latitude and longitude
  final LatLng _center = const LatLng(-1.2996871018096856, 36.807450345658594);

  // this will hold the generated polylines
// this set will hold my markers
Set<Marker> _markers = {};
// this will hold the generated polylines
Set<Polyline> _polylines = {};
// this will hold each polyline coordinate as Lat and Lng pairs
List<LatLng> polylineCoordinates = [];
// this is the key object - the PolylinePoints
// which generates every polyline between start and finish
PolylinePoints polylinePoints = PolylinePoints();
String googleAPIKey = 'AIzaSyDNAJLCsDoxcyAxNR-nV_J_81Xz6FJQ6Yc';

@override
    void initState() {
      super.initState();
     // setSourceAndDestinationIcons();
    }

  

  //added map functionality
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Map of Facilities near you'),
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
          tiltGesturesEnabled: false,
        //  onMapCreated: _onMapCreated,
       markers: _markers,
      polylines: _polylines,
        //trafficEnabled: true,
        //mapType: MapType.satellite,
          initialCameraPosition: CameraPosition(
           zoom: CAMERA_ZOOM,
      bearing: CAMERA_BEARING,
      tilt: CAMERA_TILT,
      target: SOURCE_LOCATION
           
          ),          
        ),
    );   
  }

  void _onMapCreated(GoogleMapController controller) {
   _controller.complete(controller);   
    setMapPins();
    setPolylines();
  }

  //method for setting markers
  void setMapPins() {
   setState(() {
      // source pin
      _markers.add(Marker(
         markerId: MarkerId('sourcePin'),
         position: SOURCE_LOCATION,
        // icon: sourceIcon
      ));
      // destination pin
      _markers.add(Marker(
         markerId: MarkerId('destPin'),
         position: DEST_LOCATION,
        // icon: destinationIcon
      ));
   });
}

//method  for drawing polylines
  setPolylines() async {
   List<PointLatLng> result = await
      polylinePoints?.getRouteBetweenCoordinates(
         googleAPIKey,
         SOURCE_LOCATION.latitude, 
         SOURCE_LOCATION.longitude,
         DEST_LOCATION.latitude, 
         DEST_LOCATION.longitude);
   if(result.isNotEmpty){
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.forEach((PointLatLng point){
         polylineCoordinates.add(
            LatLng(point.latitude, point.longitude));
      });
   }
   setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
         polylineId: PolylineId('poly'),
         color: Color.fromARGB(255, 40, 122, 198),
         points: polylineCoordinates
      );
 
      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
}
//   Set<Marker> _createMarker() {
//   return {
//     Marker(
//         markerId: MarkerId("marker_1"),
//         position: _center,
//         infoWindow: InfoWindow(title: 'Marker 1'),
//         rotation: 90),
//     // Marker(
//     //   markerId: MarkerId("marker_2"),
//     //   position: LatLng(-1.2996871018096856, 36.807450345658594),
//     // ),
//   };
// }

}