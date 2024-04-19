import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task/core/components/constants.dart';
import 'package:task/core/utils/image_resources.dart';
import 'package:task/features/home/model/home_model.dart';

import '../../../core/utils/font_manager.dart';
import '../../../core/widgets/image_net.dart';
import '../../../core/widgets/price_widget.dart';

class ListProducts extends StatelessWidget {
  ListProducts({required this.products});

  List<Products> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
          itemBuilder: (c,i)=>ProductListItem(product: products[i]),
          separatorBuilder: (c,i)=>const Gap(20),
          scrollDirection: Axis.horizontal,
          itemCount: products.length??0,
      ),
    );
  }
}


class ProductListItem extends StatelessWidget {
  ProductListItem({required this.product});
  Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width*.28,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNet(image: product.mainImage??'',width: 100,height: 100,),
          Text(
            product.name??'',
            style: FontManager.getRegularStyle(fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            product.shortDesc??'',
            style: FontManager.getRegularStyle(fontSize: 8),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          PriceWidget(isGrid: false,product: product,)
        ],
      ),
    );
  }
}

