import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lakini_gp/core/utils/styles.dart';

import '../../data/models/location_model.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation location;
  final bool isSelected;
  const MapScreen(
      {this.location = const PlaceLocation(
          address: "", latitude: 31.2317337, longitude: 29.9704417),
      this.isSelected = true,
      super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(10, 17, 32, 1),
        title: Text(
          widget.isSelected ? "Pick Your Location" : "Location Details",
          style: Styles.textStyle18,
        ),
        actions: [
          if (widget.isSelected)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(_pickedLocation);
              },
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      body: GoogleMap(
        onTap: !widget.isSelected
            ? null
            : (newLocation) {
                setState(() {
                  _pickedLocation = newLocation;
                });
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("x1"),
            position: _pickedLocation ??
                LatLng(
                  widget.location.latitude,
                  widget.location.longitude,
                ),
          )
        },
      ),
    );
  }
}
