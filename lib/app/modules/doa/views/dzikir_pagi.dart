import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

import 'package:get/get.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/sizedbox/sizedbox.dart';
import 'package:quranku/widget/text/txt.dart';

import '../controllers/doa_controller.dart';

class DzikirPagi extends GetView<DoaController> {
  const DzikirPagi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: Txt(
            text: "Dzikir Pagi",
            weight: bold,
            color: mainColor,
          ),
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
        ),
        body: Obx(() => controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              )
            : ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  for (var i = 0; i < controller.listDzikirPagi.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Txt(
                              text: controller.listDzikirPagi[i].arab!,
                              weight: bold,
                              size: 18,
                            ),
                          ),
                        ),
                        verticalSpace(10),
                        Txt(text: controller.listDzikirPagi[i].indo!),
                        verticalSpace(15),
                        Txt(
                          text:
                              "Diulang Sebanyak : ${controller.listDzikirPagi[i].ulang!}",
                          weight: bold,
                          size: 12,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        verticalSpace(12)
                      ],
                    )
                ],
              )));
  }
}
