import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/app/data/url/image_url.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/container/cntr.dart';
import 'package:quranku/widget/container/cntr_image_assets.dart';
import 'package:quranku/widget/sizedbox/sizedbox.dart';
import 'package:quranku/widget/text/txt.dart';
import 'package:quranku/widget/textform/txtform.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  IntroView({Key? key}) : super(key: key);
  final keyName = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Form(
        key: keyName,
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(100),
              Txt(
                text: 'QuranKu',
                size: 30,
                weight: bold,
                color: mainColor,
              ),
              verticalSpace(20),
              Txt(
                text: 'Pelajari Quran dan\nBacalah sekali setiap hari',
                color: greyColor,
                textAlign: TextAlign.center,
                size: 16,
              ),
              verticalSpace(40),
              CntrImageAssets(
                imageUrl: intro,
                width: Get.width,
                height: 300,
                radius: BorderRadius.circular(20),
              ),
              verticalSpace(10),
              TxtForm(
                validate: (value) {
                  if (value!.isEmpty) {
                    return "Masukkan nama kamu!";
                  } else {
                    return null;
                  }
                },
                borderColor: Colors.grey[400],
                onChange: (p0) {},
                controller: controller.nama,
                onTap: () {},
                hintText: "Masukkan Nama Kamu",
              ),
              verticalSpace(20),
              Cntr(
                ontap: () async {
                  var isValid = keyName.currentState!.validate();
                  if (isValid) {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('nama', controller.nama.text);
                    Get.offAllNamed(Routes.DASHBOARD);
                  }
                },
                alignment: Alignment.center,
                height: 50,
                width: Get.width / 2,
                color: const Color(0xffF9B091),
                radius: BorderRadius.circular(20),
                child: Txt(
                  text: 'Get Started',
                  color: whiteColor,
                  size: 18,
                  weight: bold,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
