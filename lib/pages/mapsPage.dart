import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final List<LatLng> cancerCenters = [
  LatLng(-9.6496, -35.7335), // Santa Casa Cancer Center - Farol, Maceió
  LatLng(-9.6490, -35.7332), // Oncologia Unimed - Farol, Maceió
  LatLng(-9.5511, -35.7809), // CACON - HUPAA/UFAL - Cidade Universitária
  LatLng(-9.6485, -35.7328), // Hospital Memorial Arthur Ramos - Gruta de Lourdes
  LatLng(-9.6487, -35.7329), // Hospital Medradius - Gruta de Lourdes
  LatLng(-9.6492, -35.7330), // Hospital Cliom - Farol
];

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
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();


  Set<Marker> markers = cancerCenters.asMap().entries.map((entry) {
    int idx = entry.key;
    LatLng pos = entry.value;
    return Marker(
      markerId: MarkerId('local_$idx'),
      position: pos,
      infoWindow: InfoWindow(
        title: 'Centro Oncológico ${idx + 1}',
        snippet: 'Tratamento de câncer em Maceió',
      ),
    );
  }).toSet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: widget.latLong,
          zoom: 14.5,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}