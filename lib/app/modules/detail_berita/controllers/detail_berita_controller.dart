import 'dart:ui';

import 'package:get/get.dart';
import 'package:quranku/app/modules/berita/controllers/berita_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailBeritaController extends GetxController {
  var controllerWeb;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    controllerWeb = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            isLoading(true);
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            isLoading(false);
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(Get.find<BeritaController>().urlBerita.value));
  }
}
