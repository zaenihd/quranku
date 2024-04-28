import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/container/cntr_image_network.dart';
import 'package:quranku/widget/sizedbox/sizedbox.dart';
import 'package:quranku/widget/text/txt.dart';

import '../controllers/berita_controller.dart';

class BeritaView extends GetView<BeritaController> {
  const BeritaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: Txt(
            text: "Artikel Terbaru",
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
            for (var i = 0; i < controller.listBerita.length; i++)
              InkWell(
                onTap: () {
                  controller.urlBerita.value = controller.listBerita[i].link!;
                  controller.judulBerita.value = controller.listBerita[i].title!;
                  Get.toNamed(Routes.DETAIL_BERITA);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CntrImageNetwork(
                          radius: BorderRadius.circular(10),
                            imageUrl: controller.listBerita[i].thumbnail!,
                            width: 100,
                            height: 100),
                        horizontalSpace(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: Get.width / 1.8,
                                child: Txt(
                                  text: controller.listBerita[i].title!,
                                  maxLines: 1,
                                  textOverFlow: TextOverflow.ellipsis,
                                  weight: bold,
                                )),
                            SizedBox(
                                width: Get.width / 1.7,
                                child: Txt(
                                  text: controller.listBerita[i].description!,
                                  maxLines: 3,
                                  textOverFlow: TextOverflow.ellipsis,
                                )),
                          ],
                        ),
                      ],
                    ),
                    const Divider(thickness: 1,),
                    verticalSpace(10)
                  ],
                ),
              )
          ],
        ));
  }
}
