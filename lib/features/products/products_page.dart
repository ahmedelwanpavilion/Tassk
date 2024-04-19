import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/utils/color_resources.dart';
import 'package:task/core/utils/font_manager.dart';
import 'package:task/core/widgets/grid_products.dart';
import 'package:task/core/widgets/shimmers/products_shimmer.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/cubit/home_states.dart';
import 'package:task/features/products/widgets/arrow_back.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({required this.homeType,required this.title});

  String homeType;
  String title;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  @override
  void initState() {
    context.read<HomeCubit>().getMoreProducts(homeType: widget.homeType);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 60,
            leading: ArrowBack(),
            title: Text(
              widget.title,
              style: FontManager.getRegularStyle(fontSize: 20),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: ()async{
              await Future.delayed(Duration.zero,(){
                cubit.productsModel = null;
                cubit.getMoreProducts(homeType: widget.homeType);
              });
            },
            child: Column(
              children: [
                Container(
                    width: double.infinity, height: 8,
                    color: Colors.grey.shade200
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                    child: ConditionalBuilder(
                      condition: state is! GetProductsErrorState,
                      fallback: (context)=>
                          Center(child: Text('حدث خطا من السيرفر'),),
                      builder: (context)=> ConditionalBuilder(
                        condition: cubit.productsModel!=null,
                        fallback: (context)=>ProductsShimmer(),
                        builder: (context)=> ConditionalBuilder(
                          condition: cubit.productsModel?.data?.isNotEmpty??false,
                          fallback:(context)=>
                              Center(child: Text('لا يوجد منتجات بعد'),),
                          builder:(context)=> GridProduct(
                            isScroll: true,
                            products: cubit.productsModel?.data??[],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
