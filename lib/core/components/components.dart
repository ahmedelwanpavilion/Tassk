import 'dart:io';

import 'package:flutter/material.dart';

import '../../features/no_connection/no_connection_page.dart';
import '../utils/color_resources.dart';
import 'constants.dart';




void navigateTo(context, widget) {
  Navigator.push(
    context,
    PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        }
    ),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastOutSlowIn;

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        }
    ),
        (route) => false,
  );
}



LinearGradient linearGradient (){
  return LinearGradient(
      begin: AlignmentDirectional.centerStart,
      end: AlignmentDirectional.centerEnd,
      tileMode: TileMode.mirror,
      colors: [
        ColorResources.kDefaultColor,
        ColorResources.kDeepDefaultColor,
      ]
  );
}

checkNet(context) {
  if (!isConnect!) {
    navigateTo(context,NoConnectPage(),);
  }
}
// checkNet(context) {
//   if (!isConnect!) {
//     navigateTo(context,NoNet(),);
//   }
// }

