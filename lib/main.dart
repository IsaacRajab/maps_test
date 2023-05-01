import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: const mapscreen() ,
    );
  }

}class mapscreen extends StatefulWidget {
  const mapscreen({Key? key}) : super(key: key);

  @override
  State<mapscreen> createState() => _mapscreenState();
}

class _mapscreenState extends State<mapscreen> {

  static const _initialCameraPosition =CameraPosition(
      target: LatLng(31.9522,35.2332),
      zoom: 14
  );
  late GoogleMapController _googleMapController;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(48, 48)), "assets/icon1.png")
        .then(
          (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }



  @override
  void dispose(){
    _googleMapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        myLocationEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (controller)=> _googleMapController = controller,
        markers:
        {
          Marker(
          markerId: const MarkerId("marker1"),
          position: const LatLng(31.9522,35.2332),
          draggable: true,


          onDragEnd: (value) {
            // value is the new position
          },
            icon: markerIcon,

        ),

          Marker(
            markerId: MarkerId("marker2"),
            icon: markerIcon,
            position: LatLng(31.4522,35.2332),

          ), Marker(
          markerId: MarkerId("marker3"),
          icon: markerIcon,
          position: LatLng(31.6522,35.2332),

        ),
          Marker(
            markerId: MarkerId("marker4"),
            icon: markerIcon,
            position: LatLng(31.5522,35.2332),

          ),
          Marker(
            markerId: MarkerId("marker5"),
            icon: markerIcon,
            position: LatLng(31.3522,35.2332),

          ),

          },

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: ()=> _googleMapController.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition)) ,
        child: const Icon(Icons.center_focus_strong),
      ),
      
    );
  }
}



