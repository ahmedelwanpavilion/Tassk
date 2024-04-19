import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task/core/utils/font_manager.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.share),
        const Gap(30),
        Text(
          'Search product',
          style: FontManager.getRegularStyle(fontSize: 22,color: Colors.grey.shade500),
        )
      ],
    );
  }
}
