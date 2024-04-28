import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/app/modules/berita/controllers/berita_controller.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/text/txt.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/detail_berita_controller.dart';

class DetailBeritaView extends GetView<DetailBeritaController> {
  const DetailBeritaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              color: mainColor,
            ),
          ),
          title: Txt(
            text: Get.find<BeritaController>().judulBerita.value,
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
            : WebViewWidget(
                controller: controller.controllerWeb,
              )));
  }
}
