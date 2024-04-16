import 'package:assignment/constant/colorconstant.dart';
import 'package:assignment/views/widgets/boxdeco.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class BodyCard extends StatelessWidget {
  final dynamic data;
  const BodyCard({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      width: w,
      padding: const EdgeInsets.only(top: 10),
      decoration: boxdeco,
      child: Column(
        children: [
          data.title!.text.make(),
          data.subTitle!.text.make(),
          "5.0".text.make(),
          "9,591".text.make(),
          "Mentor".text.make(),
          "Last update".text.make(),
          DateFormat('MM/yyyy')
              .format(DateTime.parse(data.updatedAt!))
              .text
              .make(),
          "BDT ${data.price}".text.make(),
          ElevatedButton(onPressed: () {}, child: "Buy now".text.make()),
          ElevatedButton(onPressed: () {}, child: "Buy now".text.make()),
          ElevatedButton(onPressed: () {}, child: "Buy now".text.make()),
          "What you'll learn".text.make(),
          ListView.builder(
              itemCount: data.learningTopic!.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColor.purple,
                      radius: 5,
                    ),
                    data.learningTopic![index].text.make()
                  ],
                );
              }),
          "Show more".text.make(),
          "Course Curriculum".text.make(),
          ListView.builder(
            itemCount: data.sections!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    "Section ${data.sections![index].id} -${data.sections![index].topic}"
                        .text
                        .make(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
