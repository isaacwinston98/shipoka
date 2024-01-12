import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shipoka/core/constant/app_theme.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/core/navigator/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      title: 'Shipoka',
      theme: AppTheme.themeData,
      onGenerateRoute: onGenerateRoute,
      initialRoute: RouteName.splashScreen,
    );
  }
}