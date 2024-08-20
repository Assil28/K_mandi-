import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:k_mandi/core/class/statusrequest.dart';
import 'package:k_mandi/core/constant/routes.dart';

class AddAddressController extends GetxController {
  Completer<GoogleMapController>? completercontroller;
  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? kGooglePlex;

//bch k nenzel ale lmap tetbadel localisation
  addMarkers(LatLng latlang) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latlang));
    lat = latlang.latitude;
    long = latlang.longitude;
    update();
  }

  goToPageAddDetailsAddress() {
    Get.toNamed(AppRoutes.addressadddetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  getCurrentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    getCurrentLocation();
    completercontroller = Completer<GoogleMapController>();
    super.onInit();
  }
}
