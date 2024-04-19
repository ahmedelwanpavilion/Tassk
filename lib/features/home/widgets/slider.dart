import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:task/core/widgets/image_net.dart';

import '../cubit/home_cubit.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return ConditionalBuilder(
      condition: cubit.homeModel?.data?.slider?.isNotEmpty??false,
      fallback: (context)=>Text(
        'لا يوجد اعلانات بعد'
      ),
      builder: (context)=> CarouselSlider(
        items: cubit.homeModel?.data?.slider?.map((e) =>Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: ImageNet(image:e.image??'',fit: null,),
        ),).toList(),
        options: CarouselOptions(
            height: 139,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, reason) {},
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            enlargeCenterPage: true),
      ),
    );
  }
}
