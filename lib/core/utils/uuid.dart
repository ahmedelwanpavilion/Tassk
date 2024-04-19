import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class Uuid{
  static Future<String?> getUuid()async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(!kIsWeb){
      if(Platform.isAndroid){
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id;
      }
      if(Platform.isIOS){
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      }
    }
    if(kIsWeb){
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      print(webBrowserInfo.toMap());
      return webBrowserInfo.productSub;
    }
  }
}