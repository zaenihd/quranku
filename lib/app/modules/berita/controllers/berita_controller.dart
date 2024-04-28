import 'dart:developer';

import 'package:get/get.dart';
import 'package:quranku/api/base_api/base_dio.dart';
import 'package:quranku/app/data/models/list_berita.dart';

class BeritaController extends GetxController {
  RxBool isLoading = false.obs;
  RxString urlBerita = "".obs;
  RxString judulBerita = "".obs;
  RxList<Post> listBerita = RxList<Post>.empty();
 Future<dynamic> getListBerita() async {
    final params = <String, dynamic>{
      // "serviceId": serviceId,
    };
    isLoading(true);
    try {
      final result = await RestClient()
          .request('https://api-berita-indonesia.vercel.app/republika/islam/', Method.GET, params);
      final data = listBeritaFromJson(result.toString());
      listBerita.value = data.data!.posts!;
      log('masuuk');
      isLoading(false);
      // ignore: empty_catches, unused_catch_clause
    } on Exception catch (e) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getListBerita();

    // TODO: implement onInit
    super.onInit();
  }
}
