import 'package:facebook/core/routes/app_router.dart';
import 'package:facebook/core/routes/app_routes.dart';
import 'package:facebook/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: false,
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Facebook',
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.splash,
        );
      },
    );
  }
}
