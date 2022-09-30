import 'package:flutter/material.dart';
import 'package:geometer/SPEED/colors/colros.dart';
import 'package:geometer/SPEED/functions/fn_to_set_decimal_places_in_speed.dart';
// import 'package:geometer/colors/colros.dart';
// import 'package:geometer/functions/fn_to_set_decimal_places_in_speed.dart';



AppBar custom_app_bar=AppBar(
  leadingWidth: 110,
  leading:StreamBuilder(
    stream: Stream.periodic(const Duration(seconds: 1)),
    builder:  (context, snapshot) {
return Center(
child: Container(width:100,child: Text(DateTime.now().hour.toString()+" :" + DateTime.now().minute.toString()+" :"  +DateTime.now().second.toString(),style: appbar_text_style,)),);
},
  ),
        title: Text("Geometer App"),
        centerTitle: true,
        backgroundColor: appBar_background_color,
      );










Drawer custom_drawer=Drawer(

        backgroundColor:drawer_background_color,
        child: Column(
          children: [
            Container(height:120,child: UserAccountsDrawerHeader(accountName:Text("Alok Kumar Maurya"), accountEmail:Text("alokkumarmaurya5556@gmail.com"))),
            InkWell(child: Text("Set decimal places",style: drawer_text_style,),onTap: (){fn_to_set_decimal_places_in_speed();},)
          ],
        ),
      );








TextStyle text_style=TextStyle(color: text_color,fontSize: 30);
TextStyle drawer_text_style=TextStyle(color: drawer_text_color,fontSize: 20);
TextStyle appbar_text_style=TextStyle(fontSize: 20);
