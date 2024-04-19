import 'package:flutter/material.dart';
import 'package:task/core/components/components.dart';
import 'package:task/core/utils/font_manager.dart';
import 'package:task/core/utils/image_resources.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/features/splash/splash_page.dart';


class NoConnectPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageResources.noConnection,height: 156,width: 156,),
          Text(
            'لا يوجد اتصال بالإنترنت',
            textAlign: TextAlign.center,
            style: FontManager.getMediumStyle(fontSize: 20),
          ),
          Text(
            'تأكد من اتصالك وحاول مرة أخرى',
            textAlign: TextAlign.center,
            style: FontManager.getMediumStyle(),
          ),
          const SizedBox(height: 20,),
            CustomButton(
                text:'إعادة التحميل',
                onTouch:(){
                  navigateAndFinish(context, SplashPage());
                }
            )
        ],
      ),
    );
  }
}
