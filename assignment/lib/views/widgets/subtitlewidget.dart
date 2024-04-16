import 'package:assignment/constant/colorconstant.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return text.text.color(AppColor.textcolor).fontWeight(FontWeight.w400).make();
  }
}