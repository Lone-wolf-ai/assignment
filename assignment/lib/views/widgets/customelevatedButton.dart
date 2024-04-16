import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  final Color forgroundcolor ;
  final Color bordercolor;
  final Color textcolor;
  final double width;
  final String text;
  final bool main;
  const CustomButton({super.key, required this.forgroundcolor, required this.bordercolor, required this.width, required this.text, required this.textcolor, required this.main});

  @override
  Widget build(BuildContext context) {
    
    return text
        .text
        .color(textcolor).fontWeight(main?FontWeight.w700:FontWeight.w500).size(main?16:12)
        .make()
        .centered()
        .box
        .color(forgroundcolor)
        .border(color: bordercolor)
        .width(width)
        .roundedSM
        .p16
        .make()
        .onTap(() {});
  }
}
