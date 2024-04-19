import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'core/bloc_observer/bloc_observer.dart';
import 'core/components/constants.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio.dart';
import 'features/login/cubit/login_cubit.dart';
import 'features/splash/splash_page.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key:'token');
  userId = CacheHelper.getData(key:'userId');
  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      useOnlyLangCode: true,
      path: 'assets/langs',
      fallbackLocale: const Locale('ar'),
      startLocale: Locale('ar'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color.fromRGBO(41, 167, 77, 50),
        //or set color with: Color(0xFF0000FF)
        statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubit()..checkInterNet()),
        BlocProvider(create: (context)=>HomeCubit()..init()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: 'Inter',
            appBarTheme:const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
            )
        ),
        home: SplashPage(),
      ),
    );
  }
}
