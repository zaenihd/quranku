import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

import 'package:get/get.dart';
import 'package:quranku/app/modules/doa/views/doa_from.dart';
import 'package:quranku/app/modules/doa/views/dzikir_pagi.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/sizedbox/sizedbox.dart';
import 'package:quranku/widget/text/txt.dart';

import '../controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  const DoaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: Txt(
            text: "Doa",
            weight: bold,
            color: mainColor,
          ),
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            cardDoa(
              name: "Dzikir Pagi",
              ontap: () {
                controller.getDzikirPagi();
                Get.to(() => const DzikirPagi(),
                    transition: Transition.rightToLeft);
              },
              icon: FlutterIslamicIcons.tasbihHand,
            ),
            cardDoa(
              name: "Doa Harian",
              ontap: () {
                controller.getDoa('harian');
                Get.to(() => DoaFrom(namaDoa: "Harian"),
                    transition: Transition.rightToLeft);
              },
              icon: FlutterIslamicIcons.prayingPerson,
            ),
            cardDoa(
              name: "Doa dari Hadist",
              ontap: () {
                controller.getDoa('hadits');
                Get.to(() => DoaFrom(namaDoa: "Hadits"),
                    transition: Transition.rightToLeft);
              },
              icon: FlutterIslamicIcons.prayingPerson,
            ),
            cardDoa(
              name: "Doa dari Qur'an",
              ontap: () {
                controller.getDoa('quran');
                Get.to(() => DoaFrom(namaDoa: "Qur'an"),
                    transition: Transition.rightToLeft);
              },
              icon: FlutterIslamicIcons.prayingPerson,
            ),
            cardDoa(
              name: "Doa Pilihan",
              ontap: () {
                controller.getDoa('pilihan');
                Get.to(() => DoaFrom(namaDoa: "Pilihan"),
                    transition: Transition.rightToLeft);
              },
              icon: FlutterIslamicIcons.prayingPerson,
            ),
          ],
        ));
  }

  Column cardDoa(
      {required String name,
      required Function() ontap,
      required IconData icon}) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: mainColor,
                  ),
                  horizontalSpace(10),
                  Txt(
                    text: name,
                    weight: medium,
                    size: 16,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: mainColor,
                size: 20,
              )
            ],
          ),
        ),
        verticalSpace(5),
        const Divider(
          thickness: 1,
        ),
        verticalSpace(10),
      ],
    );
  }
}
