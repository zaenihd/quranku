import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quranku/api/base_api/base_dio.dart';
import 'package:quranku/api/main_url/main_url.dart';
import 'package:quranku/app/data/models/list_quran.dart';

class HomeController extends GetxController {
  RxList<Surah> listSurah = RxList<Surah>.empty();
  RxList<Surah> listSurahSearch = RxList<Surah>.empty();
  RxBool isLoading = false.obs;
  RxBool isSearch = false.obs;
  TextEditingController searchC = TextEditingController();
  RxString searchValue = "".obs;
  RxString nama = "".obs;
  RxString namaSurah = "".obs;
  RxString surahKe = "".obs;

  Future<dynamic> getListSurah() async {
    final params = <String, dynamic>{
      // "serviceId": serviceId,
    };
    isLoading(true);
    try {
      final result = await RestClient()
          .request('${MainUrl.urlApi}surat', Method.GET, params);
      final data = quranSurahFromJson(result.toString());
      listSurah.value = data.data!;
      log('masuuk');
      isLoading(false);
      // ignore: empty_catches, unused_catch_clause
    } on Exception catch (e) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getListSurah();
    log('masuuk');

    // TODO: implement onInit
    super.onInit();
  }
}
