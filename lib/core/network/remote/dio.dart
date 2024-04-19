import 'dart:async';
import 'package:dio/dio.dart';

import '../../components/constants.dart';


class DioHelper {
  static late Dio dio;
  static late Response response;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://ihoneyherb.com/test-application/',
        connectTimeout: const Duration(seconds:  20),
        receiveTimeout: const Duration(seconds:  20),
        sendTimeout: const Duration(seconds:  20),
        receiveDataWhenStatusError: true,
        validateStatus: (status) => true,
        followRedirects: true,
      ),
    );
  }

  static Future<Response> getData(
      {
        required String url,
        Map<String , dynamic>? data,
        Map<String, dynamic>? query,
        String? token,
        String? lang,
      }) async {

    dio.options.headers =
    {
      'lang':'ar' ,
      'Authorization': "$token" ,//'Bearer $token'
      'Content-Type': 'application/json',
      'Accept-Language': 'ar',
    };
      return response = await dio.get(url, queryParameters: query,data: data,);

  }

  static Future<Response> deleteData(
      {
        required String url,
        Map<String , dynamic>? data,
        Map<String, dynamic>? query,
        String? token,
        String? lang,
      }) async {

    dio.options.headers =
    {
      'lang':'ar' ,
      'Authorization':token ,
      'Content-Type': 'application/json',
      'Accept-Language': 'ar',
    };
      return response = await dio.delete(url, queryParameters: query,data: data);

  }

  static Future<Response> postData({
    required String url,
    Map<String , dynamic>? data,
    String? token,
    String? lang ,


  }) async {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':token ,
      'Accept-Language': 'ar',
    };

    return response = await dio.post(url, data: data,);
  }

  static Future<Response> postData2({
    required String url,
    String? token,
    String? lang ,
    FormData? formData,
  }) async {

    dio.options.headers =
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':token ,
      'lang':'ar' ,
      'Accept-Language': 'ar',

    };

    return response = await dio.post(url, data: formData,);
  }


  static Future<Response> putData({
    required String url,
    Map<String , dynamic>? data,
    String? token,
    FormData? formData,


  }) async {
    dio.options.headers =
    {
      'lang':'ar' ,
      'Authorization':token ,
      'Content-Type': 'application/json',
      'Accept-Language': 'ar',
    };
    return response = await dio.put(url, data: data??formData);
  }
}
