import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/app/data/url/image_url.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/container/cntr_image_assets.dart';
import 'package:quranku/widget/text/txt.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getStarted();
    return Scaffold(
      body: CntrImageAssets(
        padding: const EdgeInsets.only(top: 150),
        imageUrl: intro,
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Txt(
              text: 'QuranKu',
              size: 50,
              color: whiteColor,
              weight: bold,
            ),
            Txt(
              textAlign: TextAlign.center,
              text: 'Learn Quran and \nRecite once everyday',
              size: 16,
              color: Colors.grey[300],
              weight: medium,
            ),
          ],
        ),
      ),
    );
  }
}
