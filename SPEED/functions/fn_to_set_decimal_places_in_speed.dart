import 'package:flutter/material.dart';
import 'package:geometer/SPEED/global_variable/global_variable.dart';
// import 'package:geometer/global_variable/global_variable.dart';
import 'package:get/get.dart';
var items=[1,2,3,4,5];
fn_to_set_decimal_places_in_speed()
{
  return Get.defaultDialog(
    title:"Set speed round decimal",
    middleText: "Choose the one ",
    content: DropdownButton(value:no_of_fecimal_places_in_speed,
      items:items.map((int items){
        return DropdownMenuItem(child:Text(items.toString()),value: items,);
      }).toList(),
    onChanged: (int? value){no_of_fecimal_places_in_speed=value!.toInt();},
    )

  );
}