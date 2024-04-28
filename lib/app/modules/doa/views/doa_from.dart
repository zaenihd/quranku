import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

import 'package:get/get.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/sizedbox/sizedbox.dart';
import 'package:quranku/widget/text/txt.dart';

import '../controllers/doa_controller.dart';

class DoaFrom extends GetView<DoaController> {
  DoaFrom({Key? key, required this.namaDoa}) : super(key: key);
  String namaDoa;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: Txt(
            text: "Doa $namaDoa",
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
                  for (var i = 0; i < controller.listDoa.length; i++)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Txt(
                          text: "${controller.listDoa[i].judul!} :",
                          weight: bold,
                        ),
                        verticalSpace(15),
                        SizedBox(
                          width: Get.width,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Txt(
                              text: controller.listDoa[i].arab!,
                              weight: bold,
                              size: 18,
                            ),
                          ),
                        ),
                        verticalSpace(10),
                        Txt(text: controller.listDoa[i].indo!),
                        verticalSpace(15),
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
