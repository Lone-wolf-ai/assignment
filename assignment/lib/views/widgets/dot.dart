import 'package:assignment/constant/colorconstant.dart';
import 'package:flutter/material.dart';

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 5),
      child: CircleAvatar(
        backgroundColor: AppColor.purple,
        radius: 3,
      ),
    );
  }
}
