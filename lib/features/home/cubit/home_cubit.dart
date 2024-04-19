import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/core/network/remote/dio.dart';
import 'package:task/core/network/remote/end_point.dart';
import 'package:task/features/home/cubit/home_states.dart';
import 'package:task/features/home/model/home_model.dart';

import '../../../core/components/constants.dart';
import '../../products/model/products_model.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit (): super(HomeInitState());

  HomeModel? homeModel;

  ProductsModel? productsModel;

  static HomeCubit get(context)=>BlocProvider.of(context);

  void init(){
    checkInterNet();
    getHomeDate();
  }

  void checkInterNet() async {
    InternetConnectionChecker().onStatusChange.listen((event) {
      final state = event == InternetConnectionStatus.connected;
      isConnect = state;
      emit(InterNetConnectionState());
    });
  }

  void getHomeDate(){
    FormData formData = FormData.fromMap({
      'auth_key' : token??'',
      'user_id' : userId??'',
    });
    DioHelper.postData2(
      url: EndPoints.Home,
      formData: formData
    ).then((value) {
      if(value.data['data']!=null&&value.data['status']==true){
        homeModel = HomeModel.fromJson(value.data);
        emit(GetHomeSuccessState());
      }else{
        emit(GetHomeErrorState());
      }
    }).catchError((e){
      emit(GetHomeErrorState());
    });
  }

  void getMoreProducts({
    required String homeType
}){
    emit(GetProductsLoadingState());
    FormData formData = FormData.fromMap({
      'auth_key' : token??'',
      'user_id' : userId??'',
      'home_types' : homeType,
      'search_with' : 'home_types',
      'item_count' : 0,
      'limit' : 30,
    });
    DioHelper.postData2(
      url: EndPoints.MoreProducts,
      formData: formData
    ).then((value) {
      if(value.data['data']!=null&&value.data['status']==true){
        productsModel = ProductsModel.fromJson(value.data);
        emit(GetProductsSuccessState());
      }else{
        emit(GetProductsErrorState());
      }
    }).catchError((e){
      print(e.toString());
      emit(GetProductsErrorState());
    });
  }
}