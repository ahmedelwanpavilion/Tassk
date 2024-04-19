import 'package:flutter/material.dart';
import 'package:task/core/utils/color_resources.dart';
import 'package:task/core/utils/font_manager.dart';

class MoreProducts extends StatelessWidget {
  MoreProducts({
    required this.moreTap,
    required this.title
});

  String title;
  VoidCallback moreTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: FontManager.getRegularStyle(fontSize: 15),
        ),
        const Spacer(),
        InkWell(
          onTap: moreTap,
          overlayColor: ColorResources.transparent,
          child: Container(
            height: 30,width: 58,
            decoration: BoxDecoration(
              color: ColorResources.kDefaultColor,
              borderRadius: BorderRadiusDirectional.circular(20)
            ),
            alignment: AlignmentDirectional.center,
            child: Text(
              'More',
              style: FontManager.getRegularStyle(fontSize: 11,color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
