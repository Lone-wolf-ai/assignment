import 'package:assignment/constant/colorconstant.dart';
import 'package:assignment/constant/imageconstant.dart';
import 'package:assignment/views/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CourseInclude extends StatelessWidget {
   CourseInclude({super.key});

  final List<String> includeItems = [
    "34.5 total hours on-demand video",
    "Support Files",
    "10 Articles",
    "Full lifetime access",
    "Access on mobile, desktop, and TV",
    "Certificate of Completion",
  ];

  final List<Widget> includeIcons = [
    Image.asset(ImageConstant.youtube, width: 15, height: 15),
    Image.asset(ImageConstant.document, width: 15, height: 15),
    Image.asset(ImageConstant.book, width: 15, height: 15),
    Image.asset(ImageConstant.infinity, width: 15, height: 15),
    Image.asset(ImageConstant.mobile,width: 15, height: 15),
    Image.asset(ImageConstant.certificate, width: 15, height: 15),
  ];

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Titlewidget(title: "This course includes", size: h * 0.018),
        10.heightBox,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: includeItems.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                includeIcons[index],
                8.widthBox,
                includeItems[index].text.fontWeight(FontWeight.w500).color(AppColor.titlecolor).size(12).make(),
              ],
            ).pLTRB(0, 0, 0, 5);
          },
        ),
      ],
    );
  }
}
