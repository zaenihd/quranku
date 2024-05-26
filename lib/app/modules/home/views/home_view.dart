import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/app/data/models/list_quran.dart';
import 'package:quranku/app/data/url/image_url.dart';
import 'package:quranku/app/modules/detail/controllers/detail_controller.dart';
import 'package:quranku/app/routes/app_pages.dart';
import 'package:quranku/theme/theme.dart';
import 'package:quranku/widget/container/cntr.dart';
import 'package:quranku/widget/container/cntr_image_assets.dart';
import 'package:quranku/widget/sizedbox/sizedbox.dart';
import 'package:quranku/widget/text/txt.dart';
import 'package:quranku/widget/textform/txtform.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  void getStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    controller.nama.value = prefs.getString('nama').toString();
    controller.surahKe.value = prefs.getString('nomer').toString();
    controller.namaSurah.value = prefs.getString('surah').toString();
    Get.put(DetailController()).nameSurah.value =
        controller.namaSurah.value == "null" ? "" : controller.namaSurah.value;
    Get.put(DetailController()).nomerSurah.value =
        controller.surahKe.value == "null" ? "" : controller.surahKe.value;
    // await prefs..remove('nama');
    print(controller.namaSurah.value);
  }

  @override
  Widget build(BuildContext context) {
    getStorage();
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: Obx(
            () => controller.isSearch.isTrue
                ? TxtForm(
                    hintText: 'Cari Surah',
                    onChange: (p0) {
                      controller.listSurahSearch.clear();
                      controller.searchValue.value = controller.searchC.text;
                      for (var userDetail in controller.listSurah) {
                        if (userDetail.namaLatin!
                            .toLowerCase()
                            .contains(controller.searchC.text.toLowerCase())) {
                          controller.listSurahSearch.add(userDetail);
                          log(controller.listSurahSearch[0].nama!);
                        }
                      }
                    },
                    controller: controller.searchC,
                    onTap: () {},
                    borderColor: mainColor,
                  )
                : Txt(
                    text: 'QuranKu',
                    weight: bold,
                    color: mainColor,
                  ),
          ),
          backgroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Obx(
                  () => controller.isSearch.isFalse
                      ? IconButton(
                          onPressed: () {
                            controller.isSearch.value = true;
                          },
                          icon: Icon(
                            Icons.search,
                            color: mainColor,
                            size: 30,
                          ))
                      : IconButton(
                          onPressed: () {
                            controller.isSearch.value = false;
                            controller.searchValue.value = "";
                            controller.searchC.clear();
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: mainColor,
                            size: 30,
                          )),
                ))
          ],
        ),
        body: Obx(() => controller.searchValue.isNotEmpty
            ? surahSearch()
            : ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  header(),
                  Obx(
                    () => controller.isLoading.isTrue
                        ? Padding(
                            padding: const EdgeInsets.only(top: 200.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: mainColor,
                              ),
                            ),
                          )
                        : surah(),
                  )
                ],
              )));
  }

  Column surah() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(
          text: "Surah",
          color: mainColor,
          size: 20,
          weight: bold,
        ),
        verticalSpace(20),
        for (var i = 0; i < controller.listSurah.length; i++)
          Column(
            children: [
              InkWell(
                onTap: () async {
                  final detailC = Get.put(DetailController());
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  detailC.nameSurah.value = controller.listSurah[i].namaLatin!;
                  detailC.nomerSurah.value =
                      controller.listSurah[i].nomor!.toString();
                  prefs.setString('surah', detailC.nameSurah.value);
                  prefs.setString('nomer', detailC.nomerSurah.value);
                  Get.toNamed(Routes.DETAIL);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CntrImageAssets(
                          imageUrl: ayat,
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          child: Txt(
                            text: "${i + 1}",
                            weight: bold,
                          ),
                        ),
                        horizontalSpace(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              text: controller.listSurah[i].namaLatin!,
                              size: 16,
                              weight: bold,
                            ),
                            SizedBox(
                              width: Get.width / 2,
                              child: Txt(
                                text:
                                    "${controller.listSurah[i].arti!} | ${controller.listSurah[i].jumlahAyat!} Ayat",
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Txt(
                      text: controller.listSurah[i].nama!,
                      size: 20,
                      weight: bold,
                      color: mainColor,
                    ),
                  ],
                ),
              ),
              verticalSpace(5),
              const Divider(
                thickness: 1,
              ),
              verticalSpace(10),
            ],
          ),
      ],
    );
  }

  ListView surahSearch() {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        verticalSpace(20),
        for (var i = 0; i < controller.listSurahSearch.length; i++)
          Column(
            children: [
              InkWell(
                onTap: () async {
                  final detailC = Get.put(DetailController());
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  detailC.nameSurah.value =
                      controller.listSurahSearch[i].namaLatin!;
                  detailC.nomerSurah.value =
                      controller.listSurahSearch[i].nomor!.toString();
                  prefs.setString('surah', detailC.nameSurah.value);
                  prefs.setString('nomer', detailC.nomerSurah.value);
                  Get.toNamed(Routes.DETAIL);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CntrImageAssets(
                          imageUrl: ayat,
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          child: Txt(
                            text: "${i + 1}",
                            weight: bold,
                          ),
                        ),
                        horizontalSpace(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Txt(
                              text: controller.listSurahSearch[i].namaLatin!,
                              size: 16,
                              weight: bold,
                            ),
                            SizedBox(
                              width: Get.width / 2,
                              child: Txt(
                                text:
                                    "${controller.listSurahSearch[i].arti!} | ${controller.listSurahSearch[i].jumlahAyat!} Ayat",
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Txt(
                      text: controller.listSurahSearch[i].nama!,
                      size: 20,
                      weight: bold,
                      color: mainColor,
                    ),
                  ],
                ),
              ),
              verticalSpace(5),
              const Divider(
                thickness: 1,
              ),
              verticalSpace(10),
            ],
          ),
      ],
    );
  }

  Column header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Txt(
          text: 'Assalamualaikum',
          size: 20,
          color: greyColor,
        ),
        verticalSpace(6),
        Txt(
          text: controller.nama.value,
          size: 23,
          weight: bold,
        ),
        verticalSpace(10),
        CntrImageAssets(
          ontap: () {
            if (Get.put(DetailController()).nameSurah.value != "") {
              Get.toNamed(Routes.DETAIL);
            }
          },
          imageUrl: quran,
          width: Get.width,
          height: Get.put(DetailController()).nameSurah.isEmpty ? 150 : 140,
          padding: const EdgeInsets.all(20),
          radius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu_book_sharp,
                    color: whiteColor,
                  ),
                  horizontalSpace(10),
                  Obx(() => Txt(
                        text: Get.put(DetailController()).nameSurah.isEmpty
                            ? "Luangkan waktu\nuntuk membaca\nAl-Quran"
                            : "Last read",
                        color: whiteColor,
                      )),
                ],
              ),
              verticalSpace(10),
              Txt(
                text: Get.put(DetailController()).nameSurah.value,
                color: whiteColor,
                size: 20,
                weight: bold,
              ),
            ],
          ),
        ),
        verticalSpace(20),
      ],
    );
  }
}
