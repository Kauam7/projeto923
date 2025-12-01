import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  final LatLng latLong;

  const GoogleMapsPage({
    super.key,
    required this.latLong,
  });

  @override
  State<GoogleMapsPage> createState() => GoogleMapsPageState();
}

class GoogleMapsPageState extends State<GoogleMapsPage> {
  final Completer<GoogleMapController> _controller = Completer<
      GoogleMapController>();

 Set<Marker> marcadores = {};
  @override
  void initState() {
    super.initState();
    adicionarMarcadores();
  }
   void adicionarMarcadores(){
     marcadores.add(
      const Marker(
           markerId: MarkerId("orla"),
       position: LatLng(-9.6658, -35.7350),
         infoWindow: InfoWindow(
         title: "Orla de Maceió",
         snippet: "Perfeito para caminhada"
         )
         )
       );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: widget.latLong,
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}