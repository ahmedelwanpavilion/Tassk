import 'package:flutter/material.dart';

import '../../components/constants.dart';
import 'default_shimmer.dart';

class ProductsShimmer extends StatelessWidget {
  const ProductsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (c,i)=>CustomShimmer(height: 200),
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,mainAxisSpacing: 20,
        childAspectRatio:size.height>800? size.width / (size.height / 1.4):size.width / (size.height / 1),
      ),
    );
  }
}
