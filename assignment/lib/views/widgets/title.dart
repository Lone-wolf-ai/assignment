import 'package:assignment/constant/colorconstant.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Titlewidget extends StatelessWidget {
  final String title;
  final double size;
  const Titlewidget({super.key, required this.title, required this.size});

  @override
  Widget build(BuildContext context) {
    return title.text.size(size).fontWeight(FontWeight.w500).capitalize.color(AppColor.titlecolor).make();
  }
}