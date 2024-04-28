import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:quranku/app/data/url/image_url.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/container/cntr.dart';
import 'package:quranku/widget/container/cntr_image_assets.dart';
import 'package:quranku/widget/sizedbox/sizedbox.dart';
import 'package:quranku/widget/text/txt.dart';

import '../controllers/detail_controller.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final player = AudioPlayer();
  final controller = Get.put(DetailController());
  @override
  void initState() {
    controller.getSurahDetail();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
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
            text: controller.nameSurah.value,
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
                  CntrImageAssets(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 30),
                    imageUrl: framequran,
                    width: Get.width,
                    height: 350,
                    radius: BorderRadius.circular(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Txt(
                          text: "${controller.surah.value!.namaLatin}",
                          color: whiteColor,
                          size: 25,
                          weight: medium,
                        ),
                        verticalSpace(10),
                        Txt(
                          text: "${controller.surah.value!.arti}",
                          color: whiteColor,
                          size: 20,
                        ),
                        verticalSpace(10),
                        Divider(
                          thickness: 1,
                          color: whiteColor,
                        ),
                        verticalSpace(15),
                        Txt(
                          text:
                              "${controller.surah.value!.tempatTurun} - ${controller.surah.value!.jumlahAyat} Ayat",
                          color: whiteColor,
                          size: 20,
                        ),
                        verticalSpace(30),
                        Image.asset(
                          bismillah,
                          width: 214,
                        ),
                        verticalSpace(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                await player.play(UrlSource(controller
                                    .surah.value!.audioFull!['02']
                                    .toString()));
                              },
                              child: Icon(
                                Icons.play_circle_sharp,
                                color: whiteColor,
                                size: 30,
                              ),
                            ),
                            horizontalSpace(20),
                            InkWell(
                              onTap: () async {
                                await player.pause();
                              },
                              child: Icon(
                                Icons.pause,
                                color: whiteColor,
                                size: 30,
                              ),
                            ),
                            horizontalSpace(20),
                            InkWell(
                              onTap: () async {
                                await player.stop();
                              },
                              child: Icon(
                                Icons.stop,
                                color: whiteColor,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  for (var i = 0; i < controller.surah.value!.ayat!.length; i++)
                    Column(
                      children: [
                        Cntr(
                          radius: BorderRadius.circular(10),
                          width: Get.width,
                          color: Colors.grey[300],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: mainColor,
                                minRadius: 15,
                                child: Txt(
                                  text: '${i + 1}',
                                  // weight: bold,
                                  color: whiteColor,
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                          text:
                                              "${controller.surah.value!.ayat![i].teksIndonesia!} Qs.${controller.nameSurah} Ayat ke-${i + 1} "));
                                    },
                                    child: Icon(
                                      Icons.share,
                                      color: mainColor,
                                      size: 25,
                                    ),
                                  ),
                                  horizontalSpace(15),
                                InkWell(
                              onTap: () async {
                                await player.play(UrlSource(controller
                                    .surah.value!.ayat![i].audio!['02']
                                    .toString()));
                              },
                              child: Icon(
                                Icons.play_circle_sharp,
                                color: mainColor,
                                size: 30,
                              ),
                            ),
                            horizontalSpace(10),
                            InkWell(
                              onTap: () async {
                                await player.pause();
                              },
                              child: Icon(
                                Icons.pause,
                                color: mainColor,
                                size: 30,
                              ),
                            ),
                            horizontalSpace(10),
                            InkWell(
                              onTap: () async {
                                await player.stop();
                              },
                              child: Icon(
                                Icons.stop,
                                color: mainColor,
                                size: 30,
                              ),
                            ),
                                ],
                              )
                            ],
                          ),
                        ),
                        verticalSpace(15),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Txt(
                              text: controller.surah.value!.ayat![i].teksArab!,
                              weight: bold,
                              size: 18,
                            )),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Txt(
                              text: controller.surah.value!.ayat![i].teksLatin!,
                              size: 10,
                              color: greyColor,
                            )),
                        verticalSpace(15),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Txt(
                              text: controller
                                  .surah.value!.ayat![i].teksIndonesia!,
                              size: 14,
                            )),
                        verticalSpace(10),
                        const Divider(
                          thickness: 1,
                        ),
                        verticalSpace(5)
                      ],
                    )
                ],
              )));
  }
}
