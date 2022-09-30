import 'package:flutter/material.dart';
import 'package:geometer/SPEED/colors/colros.dart';
import 'package:geometer/SPEED/custom%20widget/custom_widget.dart';
import 'package:geometer/SPEED/functions/geolocation_location.dart';
import 'package:geometer/SPEED/functions/location_location.dart';
import 'package:geometer/SPEED/global_variable/global_variable.dart';





class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

@override
void initState()
{
  super.initState();
  // location_by_geolocation();
  // location_location();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar:custom_app_bar,

      endDrawer: custom_drawer,

      backgroundColor: pages_background_colors,

      body: Column(
        children: [
          StreamBuilder(
            stream: location.onLocationChanged,
            
            builder: (context,snapshot)
            {
              location_by_geolocation();
              return Column(
                children: [
                  Container(child: Text((speed!=null)?(speed*3.6).toStringAsFixed(no_of_fecimal_places_in_speed):"waiting",style: text_style,)),
                  Text(latitude.toString(),style: text_style,),

                ],
              );

            }),


          Center(child: Text("Speed",style: text_style,)),
        ],
      ),


    );
  }
}