import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/container/cntr.dart';
import 'package:quranku/widget/sizedbox/sizedbox.dart';
import 'package:quranku/widget/text/txt.dart';

import '../controllers/tasbih_controller.dart';

class TasbihView extends GetView<TasbihController> {
  const TasbihView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: Txt(
            text: 'Tasbih',
            weight: bold,
            color: mainColor,
          ),
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Cntr(
                margin: const EdgeInsets.only(top: 100),
                padding: const EdgeInsets.all(30),
                border: Border.all(width: 2, color: greyColor),
                radius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Cntr(
                      alignment: Alignment.center,
                      width: Get.width / 2,
                      border: Border.all(width: 2, color: greyColor),
                      radius: BorderRadius.circular(10),
                      padding: const EdgeInsets.all(10),
                      child: Obx(() => Txt(
                            text: controller.count.value.toString(),
                            weight: bold,
                            size: 30,
                          )),
                    ),
                    verticalSpace(20),
                    Cntr(
                      width: Get.width / 2.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Txt(text: ''),
                          Cntr(
                            ontap: () {
                              controller.reset();
                            },
                            height: 40,
                            width: 40,
                            color: mainColor,
                            radius: BorderRadius.circular(100),
                            child: Icon(
                              Icons.refresh_rounded,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(10),
                    Cntr(
                      ontap: () {
                        controller.increment();
                      },
                      height: 150,
                      width: 150,
                      color: mainColor,
                      radius: BorderRadius.circular(100),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
