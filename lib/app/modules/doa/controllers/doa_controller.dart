import 'dart:developer';

import 'package:get/get.dart';
import 'package:quranku/api/base_api/base_dio.dart';
import 'package:quranku/app/data/models/doa.dart';
import 'package:quranku/app/data/models/dzikir_pagi.dart';

class DoaController extends GetxController {
   RxBool isLoading = false.obs;
   RxList<DataDzikir> listDzikirPagi = RxList<DataDzikir>.empty();
   RxList<ListDoa> listDoa = RxList<ListDoa>.empty();


  Future<dynamic> getDzikirPagi() async {
    final params = <String, dynamic>{
      // "serviceId": serviceId,
    };
    isLoading(true);
    try {
      final result = await RestClient()
          .request('https://api.dikiotang.com/dzikir/pagi', Method.GET, params);
      final data = dzikirPagiFromJson(result.toString());
      listDzikirPagi.value = data.data!;
      log('masuuk');
      isLoading(false);
      // ignore: empty_catches, unused_catch_clause
    } on Exception catch (e) {
      isLoading(false);
    }
  }

  Future<dynamic> getDoa(String doa) async {
    final params = <String, dynamic>{
      // "serviceId": serviceId,
    };
    isLoading(true);
    try {
      final result = await RestClient()
          .request('https://api.dikiotang.com/doa/$doa', Method.GET, params);
      final data = doaModelFromJson(result.toString());
      listDoa.value = data.data!;
      log('masuuk');
      isLoading(false);
      // ignore: empty_catches, unused_catch_clause
    } on Exception catch (e) {
      isLoading(false);
    }
  }
}
