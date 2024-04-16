import 'package:assignment/apiService/apiservice.dart';
import 'package:assignment/constant/colorconstant.dart';
import 'package:assignment/constant/imageconstant.dart';
import 'package:assignment/model/model.dart';
import 'package:assignment/views/widgets/appbar.dart';
import 'package:assignment/views/widgets/boxdeco.dart';
import 'package:assignment/views/widgets/boxvideoplayer.dart';
import 'package:assignment/views/widgets/courseinclude.dart';
import 'package:assignment/views/widgets/customelevatedButton.dart';
import 'package:assignment/views/widgets/dot.dart';
import 'package:assignment/views/widgets/learntopic.dart';
import 'package:assignment/views/widgets/showdescripton.dart';
import 'package:assignment/views/widgets/subtitlewidget.dart';
import 'package:assignment/views/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
      top: false,
      child: FutureBuilder(
        future: CourseService().fetchCourseDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          DataClass dataClass = snapshot.data;
          var data = dataClass.data!;
          return Scaffold(
            appBar: customAppbar(h * .033, h * 0.024),
            body: SizedBox(
              height: h,
              width: w,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          color: AppColor.purple,
                          padding: EdgeInsets.symmetric(vertical: 0.015 * h),
                        ),
                        InkWell(
                          child: Container(
                            width: w,
                            padding: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            decoration: boxdeco,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: CustomVideoPlayer(
                                    videoUrl: data.videoLinkPath!,
                                  ),
                                ),
                                20.heightBox,
                                Titlewidget(title: data.title!, size: h * .02),
                                10.heightBox,
                                CustomText(text: data.subTitle!),
                                5.heightBox,
                                Row(
                                  children: [
                                    "5.0"
                                        .text
                                        .fontWeight(FontWeight.w500)
                                        .size(15)
                                        .make(),
                                    5.widthBox,
                                    for (int i = 0; i < 5; i++)
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: AppColor.starcolor,
                                      ),
                                    5.widthBox,
                                    "(25,00)"
                                        .text
                                        .color(AppColor.textcolor)
                                        .size(10)
                                        .make(),
                                  ],
                                ),
                                5.heightBox,
                                "9,591 students"
                                    .text
                                    .fontWeight(FontWeight.w500)
                                    .size(10)
                                    .color(AppColor.textcolor)
                                    .make(),
                                20.heightBox,
                                Row(
                                  children: [
                                    "Mentor".text.fontWeight(FontWeight.w500).size(12).color(AppColor.textcolor).make(),
                                    5.widthBox,
                                    "Ashutosh Pawar"
                                        .text
                                        .semiBold
                                        .color(AppColor.purple)
                                        .make()
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      ImageConstant.appointment,
                                      width: 12,
                                      height: 12,
                                    ),
                                    "Last update"
                                        .text
                                        .size(12)
                                        .color(AppColor.textcolor)
                                        .fontWeight(FontWeight.w500)
                                        .make(),
                                    5.widthBox,
                                    DateFormat('MM/yyyy')
                                        .format(DateTime.parse(data.updatedAt!))
                                        .text
                                        .make()
                                  ],
                                ),
                                5.heightBox,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                    ),
                                    "English"
                                        .text
                                        .size(12)
                                        .color(AppColor.textcolor)
                                        .fontWeight(FontWeight.w500)
                                        .make(),
                                  ],
                                ),
                                20.heightBox,
                                "BDT ${data.price}"
                                    .text
                                    .color(AppColor.textcolor)
                                    .fontWeight(FontWeight.w700)
                                    .size(h * 0.02)
                                    .make(),
                                    10.heightBox,
                                const CustomButton(
                                  main: true,
                                    forgroundcolor: AppColor.purple,
                                    bordercolor: AppColor.purple,
                                    width: double.infinity,
                                    text: "Buy now",
                                    textcolor: Colors.white),
                                15.heightBox,
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(
                                      child: CustomButton(
                                        main: false,
                                          forgroundcolor:
                                              AppColor.buttonforeground,
                                          bordercolor: AppColor.purple,
                                          width: double.infinity,
                                          text: "Add to cart",
                                          textcolor: AppColor.purple),
                                    ),
                                    15.widthBox,
                                    const Expanded(
                                      child: CustomButton(
                                        main: false,
                                          forgroundcolor:
                                              AppColor.buttonforeground,
                                          bordercolor: AppColor.purple,
                                          width: double.infinity,
                                          text: "Add to cart",
                                          textcolor: AppColor.purple),
                                    )
                                  ],
                                ),
                                15.heightBox,
                                "What you'll Learn"
                                    .text
                                    .size(0.015 * h)
                                    .fontWeight(FontWeight.w600)
                                    .color(AppColor.titlecolor)
                                    .make(),
                                15.heightBox,
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: data.learningTopic!.length,
                                  itemBuilder: (context, index) {
                                    return LearnTopic(
                                        text: data.learningTopic![index],
                                        size: h * 0.014);
                                  },
                                ),
                                "Course Curriculum"
                                    .text
                                    .fontWeight(FontWeight.w600)
                                    .size(15)
                                    .make(),
                                Padding(
                                  //height: h * 0.2, // Adjust height as needed
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: data.sections!.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          "Section ${data.sections![index].id} -${data.sections![index].topic}"
                                              .text
                                              .make(),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const CustomButton(
                                  main: false,
                                    forgroundcolor: AppColor.buttonforeground,
                                    bordercolor: AppColor.purple,
                                    width: double.infinity,
                                    text: "16 more sections",
                                    textcolor: AppColor.purple),
                                15.heightBox,
                                CourseInclude(),
                                50.heightBox,
                                Titlewidget(
                                    title: "Requirement", size: h * 0.018),
                                10.heightBox,
                                Row(
                                  children: [
                                    const Dot(),
                                    data.requirements!.text.make()
                                  ],
                                ),
                                20.heightBox,
                                Titlewidget(
                                    title: "Description", size: h * 0.02),
                                ShowDescription(description: data.description!),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
