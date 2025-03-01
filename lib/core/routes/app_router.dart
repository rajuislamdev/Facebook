import 'package:facebook/presentation/dashboard/view/dashboard_page.dart';
import 'package:facebook/presentation/splash/views/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => DashboardPage());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
