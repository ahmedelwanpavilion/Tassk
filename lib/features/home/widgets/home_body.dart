import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/cubit/home_states.dart';
import 'package:task/features/home/widgets/slider.dart';
import '../../../core/components/components.dart';
import '../../../core/widgets/grid_products.dart';
import '../../../core/widgets/shimmers/home_shimmer.dart';
import '../../products/products_page.dart';
import 'categories.dart';
import 'list_products.dart';
import 'more_products.dart';

class HomeBody extends StatelessWidget {
  HomeBody({required this.state});

  HomeStates state;
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Expanded(
      child: ConditionalBuilder(
        condition: state is ! GetHomeErrorState,
        fallback: (context)=>const Text(
          'حدث خطأ من السيرفر'
        ),
        builder: (context)=> ConditionalBuilder(
          condition: cubit.homeModel!=null,
          fallback: (context)=>HomerShimmer(),
          builder: (context)=> RefreshIndicator(
            onRefresh: ()async{
              await Future.delayed(Duration.zero,(){
                cubit.getHomeDate();
              });
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(20),
                  HomeSlider(),
                  const Gap(20),
                  CategoriesWidget(),
                  const Gap(10),
                  Divider(),
                  const Gap(10),
                  MoreProducts(
                    moreTap: (){
                      cubit.productsModel = null;
                      navigateTo(context, ProductsPage(homeType: 'products',
                        title: 'المنتجات',));
                    },
                    title: 'المنتجات',
                  ),
                  const Gap(10),
                  ConditionalBuilder(
                    condition: cubit.homeModel?.data?.products?.isNotEmpty??false,
                    fallback: (context)=>Text('لا يوجد منتجات بعد'),
                    builder: (context)=> GridProduct(
                        products: cubit.homeModel?.data?.products??[]),
                  ),
                  const Gap(10),
                  Divider(),
                  const Gap(10),
                  MoreProducts(
                    moreTap: (){
                      cubit.productsModel = null;
                      navigateTo(context, ProductsPage(homeType: 'selected',
                        title: 'مختاره لك',));
                    },
                    title: 'مختاره لك',
                  ),
                  const Gap(10),
                  ConditionalBuilder(
                    condition: cubit.homeModel?.data?.selectedProducts?.isNotEmpty??false,
                    fallback: (context)=>Text('لا يوجد منتجات بعد'),
                    builder: (context)=> ListProducts(
                        products: cubit.homeModel?.data?.selectedProducts??[]),
                  ),
                  const Gap(10),
                  Divider(),
                  const Gap(10),
                  MoreProducts(
                    moreTap: (){
                      cubit.productsModel = null;
                      navigateTo(context, ProductsPage(homeType: 'new',
                        title: 'مختاره لك',));
                      },
                    title: 'منتجات جديده',
                  ),
                  const Gap(10),
                  ConditionalBuilder(
                    condition: cubit.homeModel?.data?.newProducts?.isNotEmpty??false,
                    fallback: (context)=>Text('لا يوجد منتجات بعد'),
                    builder: (context)=> ListProducts(
                        products: cubit.homeModel?.data?.newProducts??[]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
