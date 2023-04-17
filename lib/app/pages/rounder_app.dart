import 'package:flutter/material.dart';
import 'package:inside_training/app/pages/login/login_view.dart';
import 'package:inside_training/app/pages/pages.dart';
import 'package:inside_training/app/pages/splash/splash_view.dart';

class RouterApp {
  final RouteObserver<PageRoute> routeObserver;
  RouterApp() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    final Map args = settings.arguments as Map;

    switch (settings.name) {
      case Pages.splash:
          return _buildRoute(settings, const SplashPage());
        break;
    }
    return _buildRoute(settings, const LoginPage());
  }

  MaterialPageRoute<dynamic> _buildRoute(RouteSettings settings, Widget builder){
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder
    );
  }

}