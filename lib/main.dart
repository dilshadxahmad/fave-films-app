import 'package:fave_films/res/theme/theme_config.dart';
import 'package:fave_films/res/l10n/app_translations.dart';
import 'package:fave_films/res/routes/app_route.dart';
import 'package:fave_films/res/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.darkTheme(),
          translations: AppTranslations(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          getPages: AppRoute.appRoutes(),
          initialRoute: RouteName.onboardingScreen,
        );
      },
    );
  }
}
