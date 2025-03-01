import 'package:facebook/core/routes/app_routes.dart';
import 'package:facebook/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _size = 50;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _size = 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: appLogo);
  }

  Widget get appLogo => Center(
    child: AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.easeInOut,
      onEnd: () => Navigator.pushReplacementNamed(context, AppRoutes.dashboard),
      height: _size,
      width: _size,
      child: Assets.images.appLogo.image(height: _size, width: _size),
    ),
  );
}
