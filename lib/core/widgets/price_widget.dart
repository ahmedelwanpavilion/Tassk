import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../features/home/model/home_model.dart';
import '../utils/color_resources.dart';
import '../utils/font_manager.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget({this.isGrid = true,required this.product});

  bool isGrid;
  Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AutoSizeText(
              '${product.salePrice??''} ',
              style: FontManager.getRegularStyle(
                fontSize: isGrid?12:16,
                color: isGrid?ColorResources.kDefaultColor:Colors.red,
              ),
            ),
            AutoSizeText(
              'درهم إماراتي',
              style: FontManager.getRegularStyle(
                fontSize:isGrid? 8:11,
                color: isGrid?ColorResources.kDefaultColor:Colors.red,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Stack(
            alignment: isGrid?AlignmentDirectional.center:AlignmentDirectional.centerStart,
            children: [
              Row(
                children: [
                  AutoSizeText(
                    '${product.listPrice??''} ',
                    style: FontManager.getRegularStyle(
                      fontSize: isGrid?12:14,
                    ),
                  ),
                  AutoSizeText(
                    'درهم إماراتي',
                    style: FontManager.getRegularStyle(
                      fontSize: isGrid?8:9,
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black,
                height: 1,width: isGrid?70:85,
              )
            ],
          ),
        ),
        Align(
          alignment: isGrid?AlignmentDirectional.center:AlignmentDirectional.centerStart,
          child: Container(
            height: 17,width: 50,
            color: Colors.black,
            alignment: AlignmentDirectional.center,
            child: Text.rich(
                TextSpan(
                    text: 'خصم ',
                    style: FontManager.getMediumStyle(fontSize: 9,color: Colors.white),
                    children: [
                      TextSpan(
                        text: '${product.discount??'0'}%',
                        style: FontManager.getBoldStyle(fontSize: 8,color: Colors.white),
                      )
                    ]
                )
            ),
          ),
        )
      ],
    );
  }
}
