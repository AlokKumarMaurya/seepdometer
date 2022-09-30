import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';


  Location location=Location();
 location_location()
async {

  late bool is_serviceEnabled;
  late PermissionStatus _permissionStatus;
  late LocationData _location_data;
  bool _is_listen_location=false;
  bool _isGetLocation=false;
  bool _is_backgroung=false;


  is_serviceEnabled=await location.serviceEnabled();
  if(!is_serviceEnabled)
  {
    is_serviceEnabled=await location.requestService();
    if(is_serviceEnabled)
    {
      return ;
    }
  }


  _permissionStatus=await location.hasPermission();
  if(_permissionStatus==PermissionStatus.denied)
  {
    _permissionStatus=await location.requestPermission();

    if(_permissionStatus!=PermissionStatus.granted) return;
  }

  _location_data=await location.getLocation();

 _is_backgroung=await location.isBackgroundModeEnabled();
 if(!_is_backgroung)
 {
  _is_backgroung= await location.enableBackgroundMode();
  if(_is_backgroung) return;
 }
 location.changeNotificationOptions(channelName: "alok",title: "Location Service",subtitle: "its subtitle lat:${_location_data.latitude}, long:${_location_data.longitude}",color: Colors.lightBlueAccent,onTapBringToFront: true,);

 
 

}