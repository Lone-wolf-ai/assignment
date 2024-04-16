import 'package:assignment/constant/colorconstant.dart';
import 'package:flutter/material.dart';

class ShowDescription extends StatefulWidget {
  final String description;

  const ShowDescription({super.key, required this.description});

  @override
  _ShowDescriptionState createState() => _ShowDescriptionState();
}

class _ShowDescriptionState extends State<ShowDescription> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.description,
            maxLines: !showFullDescription ? 3 : widget.description.length,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColor.textcolor,fontWeight: FontWeight.w500,fontSize: h*0.015),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showFullDescription = !showFullDescription;
              });
            },
            child: Text(
              showFullDescription ? 'Show less' : 'Show more',
              style: const TextStyle(
                color: AppColor.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
