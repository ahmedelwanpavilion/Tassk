import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task/core/network/local/cache_helper.dart';
import 'package:task/core/network/remote/dio.dart';
import 'package:task/core/network/remote/end_point.dart';
import 'package:task/core/widgets/ui.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import '../../../core/components/components.dart';
import '../../../core/components/constants.dart';
import '../../../core/utils/uuid.dart';
import '../../home/home_page.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>{

  LoginCubit () :super(LoginInitState());



  void checkInterNet() async {
    InternetConnectionChecker().onStatusChange.listen((event) {
      final state = event == InternetConnectionStatus.connected;
      isConnect = state;
      emit(InterNetConnectionState());
    });
  }

  void login({
    required BuildContext context,
    required String email,
    required String password,
})async{
    UIAlert.showLoading(context);
    int platForm = defaultTargetPlatform == TargetPlatform.android? 1 : 2;
    String? uuid = await Uuid.getUuid();
    FormData formData = FormData.fromMap({
      'email':email.trim(),
      'password':password.trim(),
      'token':'asd342dsdddsd323dsdadasd3e',
      'platform':platForm,
      'device_id':uuid??'bfghtr5yrtytd654e6trd',
    });
    emit(LoginLoadingState());
    DioHelper.postData2(
      url: EndPoints.Login,
      formData: formData
    ).then((value) {
      if(value.data['data']!=null&&value.data['status']==true){
        token = value.data['data']['auth_key'];
        userId = value.data['data']['id'];
        CacheHelper.saveData(key: 'token', value: token);
        CacheHelper.saveData(key: 'userId', value: userId);
        Navigator.pop(context);
        emit(LoginSuccessState());
        UIAlert.showAlert(context,
            message: value.data['msg']??'',
            type: MessageType.success);
        if(context.read<HomeCubit>().homeModel!=null) {
          context.read<HomeCubit>().homeModel = null;
          context.read<HomeCubit>().getHomeDate();
        }
        navigateAndFinish(context, HomePage());
      }else{
        Navigator.pop(context);
        emit(LoginWrongState());
        UIAlert.showAlert(context,
            message: value.data['msg']??'حدث خطأ من السيرفر',
            type: MessageType.warning);
      }
    }).catchError((e){
      print(e.toString());
      Navigator.pop(context);
      emit(LoginErrorState());
      UIAlert.showAlert(context, message: 'حدث خطأ من السيرفر',
          type: MessageType.error);
    });
  }
}