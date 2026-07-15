import 'package:e_commerce_app/Core/Routing/router_gen.dart';
import 'package:e_commerce_app/Core/Styling/app_theme.dart';
import 'package:e_commerce_app/Core/networking/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 DioHelper.initDio();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (ctx, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'First Method',

          theme: AppTheme.lightcolor,
          routerConfig: RouterGen.router,
        );
      },
    );
  }
}
