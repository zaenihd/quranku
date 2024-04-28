import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/app/modules/splash_screen/views/splash_screen_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: const SplashScreenView(),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    ),
  );
}
