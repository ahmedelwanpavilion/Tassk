import 'package:flutter/material.dart';
import 'package:task/core/widgets/product_widget.dart';

import '../../features/home/model/home_model.dart';
import '../components/constants.dart';

class GridProduct extends StatelessWidget {
  GridProduct({this.isScroll = false,required this.products});

  bool isScroll;

  List<Products> products ;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: !isScroll?const NeverScrollableScrollPhysics():null,
      shrinkWrap: !isScroll,
      itemBuilder: (c,i)=>ProductWidget(product: products[i],),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,mainAxisSpacing: 0,
        childAspectRatio:size.height>800? size.width / (size.height / 1.4):size.width / (size.height / 0.9),
      ),
    );
  }
}
