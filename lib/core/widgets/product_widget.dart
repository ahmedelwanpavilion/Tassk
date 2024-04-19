import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task/core/utils/color_resources.dart';
import 'package:task/core/utils/font_manager.dart';
import 'package:task/core/utils/image_resources.dart';
import 'package:task/core/widgets/price_widget.dart';

import '../../features/home/model/home_model.dart';
import '../components/constants.dart';
import 'image_net.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget({required this.product});

  Products product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width*.5,
      child: Column(
        children: [
          ImageNet(image:product.mainImage??'',width: 200,height: 200,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                const Gap(6),
                PriceWidget(product: product),
              ],
            ),
          )
        ],
      ),
    );
  }
}



