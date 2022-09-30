

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
 var latitude;
  var longitude;
  var speed;
  var permisssion;
  late bool is_serviceEnabled;
  
  var altitude;
  var speed_accuracy;
  
  var country;
  var locality;
  var street;
  var place_name;
  var postal_code;
 location_by_geolocation()
async {
 Placemark place;
Position current_position;
is_serviceEnabled=await Geolocator.isLocationServiceEnabled();
 if(!is_serviceEnabled)
 {
  Geolocator.openLocationSettings();
  Get.showSnackbar(GetSnackBar(
    message: "Location Service not enabled",
    duration: Duration(seconds: 1),
    isDismissible: true,
  ));
 }

 permisssion=Geolocator.checkPermission();
 if(permisssion==LocationPermission.denied)
 {
  Get.showSnackbar(GetSnackBar(
    message: "Location permission denied",
    duration: Duration(seconds: 1),
    isDismissible: true,
  ));

  permisssion=await Geolocator.requestPermission();
 }

if(permisssion==LocationPermission.deniedForever)
{
  Get.showSnackbar(GetSnackBar(
    message: "Location permission denied forever :Applocation will not work",
    duration: Duration(seconds: 1),
    isDismissible: true,
  ));
}

if(permisssion==LocationPermission.unableToDetermine)
{
  Get.showSnackbar(GetSnackBar(
    message: "Unable to determine your location permission",
    duration: Duration(seconds: 1),
    isDismissible: true,
  ));
}


current_position= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);


latitude=current_position.latitude;
longitude=current_position.longitude;
altitude= current_position.altitude;
speed_accuracy= current_position.speedAccuracy;
speed=current_position.speed;


try
{
List<Placemark> placemark=await placemarkFromCoordinates(latitude, longitude);
place=placemark[0];
locality=place.locality;
country=place.country;
postal_code=place.postalCode;
place_name=place.name;
}
catch(e)
{
  Get.showSnackbar(GetSnackBar(
    message: e.toString(),
  ));
}

}