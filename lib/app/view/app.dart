import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shipoka/core/constant/app_theme.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/core/navigator/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shipoka/features/shipment/presentation/changeNotifier/shipment_notifier.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Choose your desired color
      statusBarIconBrightness: Brightness.dark, // Choose the brightness of the icons
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ShipmentProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        builder: DevicePreview.appBuilder,
        title: 'Shipoka',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('fr'),// English
        ],
        theme: AppTheme.themeData,
        onGenerateRoute: onGenerateRoute,
        initialRoute: RouteName.pickUpAndSenderDetailsTwo,
      ),
    );
  }
}
