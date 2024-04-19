import 'package:flutter/material.dart';

import '../../../core/utils/color_resources.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pop(context),
      overlayColor: ColorResources.transparent,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20),
        child: Container(
          width: 27,height: 27,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorResources.kDefaultColor
          ),
          child: Icon(Icons.arrow_back,color: Colors.white,),
        ),
      ),
    );
  }
}
