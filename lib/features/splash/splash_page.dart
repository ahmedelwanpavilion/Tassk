import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../core/components/components.dart';
import '../../core/components/constants.dart';
import '../../core/utils/color_resources.dart';
import '../../core/utils/image_resources.dart';
import '../home/home_page.dart';
import '../login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      if(token!=null){
        navigateAndFinish(context, HomePage());
      }else{
        navigateAndFinish(context, LoginPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: ColorResources.kDefaultColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: linearGradient()
        ),
        child: Center(
          child: Image.asset(ImageResources.splash,height: 240,width: 190,),
        ),
      ),
    );;
  }
}
