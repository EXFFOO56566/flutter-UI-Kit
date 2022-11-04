import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutx/flutx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/house.dart';

class EstateSearchController extends FxController {
  final LatLng center = const LatLng(45.521563, -122.677433);
  bool showLoading = true, uiLoading = true;
  late GoogleMapController mapController;
  List<House>? houses;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.85);
  int currentPage = 0;

  final Set<Marker> marker = {};

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setMapTheme();
  }

  @override
  void initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  Future<void> setMapTheme() async {
    if (AppTheme.theme == AppTheme.darkTheme) {
      String mapStyle =
          await rootBundle.loadString('assets/map/map-dark-style.txt');
      mapController.setMapStyle(mapStyle);
    }
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    houses = House.houseList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  @override
  String getTag() {
    return "search_controller";
  }

  onMarkerTap(int position) {
    currentPage = position;
    update();

    pageController.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }

  onPageChange(int position) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: marker.toList()[position].position, zoom: 10.5)));
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  addMarkers() async {
    marker.add(
      Marker(
        icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
            'assets/images/apps/estate/marker.png', 64)),
        markerId: MarkerId("id-1"),
        position: LatLng(45.121563, -122.977433),
        onTap: () {
          onMarkerTap(0);
        },
      ),
    );
    marker.add(
      Marker(
          icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
              'assets/images/apps/estate/marker.png', 64)),
          markerId: MarkerId("id-2"),
          position: LatLng(45.121563, -122.777433),
          onTap: () {
            onMarkerTap(1);
          }),
    );
    marker.add(
      Marker(
          icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
              'assets/images/apps/estate/marker.png', 64)),
          markerId: MarkerId("id-3"),
          position: LatLng(45.521563, -122.377433),
          onTap: () {
            onMarkerTap(2);
          }),
    );
    marker.add(
      Marker(
          icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(
              'assets/images/apps/estate/marker.png', 64)),
          markerId: MarkerId("id-4"),
          position: LatLng(45.721563, -122.377433),
          onTap: () {
            onMarkerTap(3);
          }),
    );
    update();
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
