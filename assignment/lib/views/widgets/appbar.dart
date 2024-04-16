import 'package:assignment/constant/colorconstant.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

AppBar customAppbar(double size,double textsize) {
  return AppBar(
    backgroundColor: AppColor.purple,
    title:
        "Course Details".text.size(textsize).fontWeight(FontWeight.w500).white.make(),
    centerTitle: true,
    leading:  Icon(
      Icons.menu,
      color: Colors.white,
      size: size,
    ),
    actions:  [
      Icon(
        Icons.shopping_cart_outlined,
        size:size,
        color: Colors.white,
      )
    ],
  );
}
