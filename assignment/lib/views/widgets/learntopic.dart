import 'package:assignment/constant/colorconstant.dart';
import 'package:assignment/views/widgets/dot.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LearnTopic extends StatelessWidget {
  final String text;
  final double size;
  const LearnTopic({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Dot().pLTRB(0, 0, 0, 8),
        5.widthBox,
        text.text
            .fontWeight(FontWeight.w500)
            .size(size)
            .color(AppColor.textcolor)
            .capitalize
            .make()
            .pLTRB(0, 0, 0, 8),
      ],
    );
  }
}
