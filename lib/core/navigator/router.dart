import 'package:flutter/material.dart';
import 'package:shipoka/core/navigator/route_extentions.dart';
import 'package:shipoka/core/navigator/route_name.dart';
import 'package:shipoka/features/auth/presentation/pages/setup_profile.dart';
import 'package:shipoka/features/auth/presentation/pages/signup.dart';
import 'package:shipoka/features/onboarding/presentation/pages/splash_screen.dart';

Route<T> onGenerateRoute<T>(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splashScreen:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SplashScreen(),
      );
    case RouteName.signUp:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Signup(),
      );
    case RouteName.setupProfile:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SetupProfile(),
      );
    default:
      return MaterialPageRoute<T>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

Route<T> _getPageRoute<T>({
  required String routeName,
  required Widget viewToShow,
}) {
  return PageRoutes.fadeThrough(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}