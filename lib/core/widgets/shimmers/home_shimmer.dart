import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task/core/widgets/shimmers/default_shimmer.dart';

import '../../components/constants.dart';

class HomerShimmer extends StatelessWidget {
  const HomerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Gap(20),
          CustomShimmer(height: 139,radius: 5,),
          const Gap(20),
          SizedBox(
            height: 85,
            child: ListView.separated(
                itemBuilder: (c,i)=>CustomShimmer(height: 60,width:60,radius: 50,),
                separatorBuilder: (c,i)=>const Gap(35),
                scrollDirection: Axis.horizontal,
                itemCount: 5
            ),
          ),
          const Gap(10),
          Divider(),
          const Gap(10),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (c,i)=>CustomShimmer(height: 200),
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,mainAxisSpacing: 20,
              childAspectRatio:size.height>800? size.width / (size.height / 1.4):size.width / (size.height / 1),
            ),
          ),
        ],
      ),
    );
  }
}
