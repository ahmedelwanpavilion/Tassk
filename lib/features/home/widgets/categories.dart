import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task/core/utils/font_manager.dart';
import 'package:task/core/utils/image_resources.dart';
import 'package:task/features/home/model/home_model.dart';

import '../../../core/widgets/image_net.dart';
import '../cubit/home_cubit.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return ConditionalBuilder(
      condition: cubit.homeModel?.data?.categories?.isNotEmpty??false,
      fallback: (context)=>const Text('لا يوجد اقسام بعد'),
      builder: (context)=> SizedBox(
        height: 85,
        child: ListView.separated(
            itemBuilder: (c,i)=>CategoryItem(cubit.homeModel?.data?.categories?[i]??Categories()),
            separatorBuilder: (c,i)=>const Gap(35),
            scrollDirection: Axis.horizontal,
            itemCount: cubit.homeModel?.data?.categories?.length??0
        ),
      ),
    );
  }
}



class CategoryItem extends StatelessWidget {
  CategoryItem(this.categories);

  Categories categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Container(
            height: 50,width: 55,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageResources.categoryShape)
              )
            ),
            alignment: AlignmentDirectional.center,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: ImageNet(image:categories.icon??''),
            ),
          ),
          Text(
            categories.catName??'untitled',
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: FontManager.getRegularStyle(fontSize: 11),
          )
        ],
      ),
    );
  }
}

