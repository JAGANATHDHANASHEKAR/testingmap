import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as h;
import 'package:testing/commonstyle/commonstyles.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  TextEditingController _searchcontroller = TextEditingController();

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  String? _address;
  PolylinePoints? polylinePoints;
  static final Polygon _kPolygon = Polygon(
    polygonId: PolygonId('_kPolygon'),
    points: [
      LatLng(-33.870840, 151.206286),
      LatLng(-33.870840, 151.206286),
      LatLng(-33.918, 151.806),
      LatLng(-33.918, 151.806),
    ],
    strokeWidth: 5,
    fillColor: Colors.transparent,
  );

  String? Address = '';
  String? location = 'Null Press Button';
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place = placemark[0];
    Address =
        '${place.street},${place.subLocality},${place.locality},${place.postalCode},${place.country}';
    setState(() {});
  }

  h.Location locat = new h.Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  @override
  void initState() {
    getLocation();
    super.initState();
    polylinePoints = polylinePoints;
    _searchcontroller = TextEditingController(text: Address);
  }

  getLocation() async {
    _serviceEnabled = await locat.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locat.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await locat.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locat.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await locat.getLocation();
  }

  Position? currentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingofMap = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: GoogleMap(
          mapToolbarEnabled: true,
          indoorViewEnabled: true,
          buildingsEnabled: true,
          // trafficEnabled: true,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          padding: EdgeInsets.only(bottom: bottomPaddingofMap),
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          tiltGesturesEnabled: false,
          compassEnabled: true,
          polylines: _polylines,
          // layoutDirection: ,
          onTap: (LatLng loc) {
            setState(() {});
          },
          onMapCreated: (GoogleMapController controller) {
            setState(() {});
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(12.986633310062187, 77.53925747436833),
            zoom: 20,
          ),
        ),
      ),
      Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0,
        child: Container(
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
              boxShadow: [BoxShadow(blurRadius: 10)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                child: TextFormField(
                  // initialValue: "$Address",
                  // controller: _searchcontroller,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      labelText: "Start",
                      helperText: "$Address",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      suffixIcon: GestureDetector(
                          onTap: () async {
                            Position position = await _determinePosition();
                            print(position.latitude);
                            GetAddressFromLatLong(position);
                            location =
                                'Lat:${position.latitude},Long:${position.longitude}';
                            setState(() {});
                          },
                          child: Icon(
                            Icons.location_searching_sharp,
                          ))),

                  onChanged: (value) {
                    "$Address";
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: "Destination",
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    "SHOW DIRECTIONS",
                    style: CommonStyle.WhiteText14w500(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]));
  }
}
