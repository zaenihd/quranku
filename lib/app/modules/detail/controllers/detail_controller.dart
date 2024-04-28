import 'dart:developer';

import 'package:get/get.dart';
import 'package:quranku/api/base_api/base_dio.dart';
import 'package:quranku/api/main_url/main_url.dart';
import 'package:quranku/app/data/models/detail_surah.dart';

class DetailController extends GetxController {
  RxString nameSurah = "".obs;
  RxString nomerSurah = "".obs;
  Rxn<Surah> surah = Rxn<Surah>();
  RxBool isLoading = false.obs;

  Future<dynamic> getSurahDetail() async {
    final params = <String, dynamic>{
      // "serviceId": serviceId,
    };
    isLoading(true);
    try {
      final result = await RestClient()
          .request('${MainUrl.urlApi}surat/${nomerSurah.value}', Method.GET, params);
      final data = detailSurahFromJson(result.toString());
      surah.value = data.data!;
      log('masuuk');
      isLoading(false);
      // ignore: empty_catches, unused_catch_clause
    } on Exception catch (e) {
      isLoading(false);
    }
  }

}
