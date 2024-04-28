import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:quranku/app/modules/berita/controllers/berita_controller.dart';
import 'package:quranku/app/modules/doa/controllers/doa_controller.dart';
import 'package:quranku/app/modules/home/controllers/home_controller.dart';
import 'package:quranku/app/modules/tasbih/controllers/tasbih_controller.dart';
import 'package:quranku/theme/theme.dart';

class DashboardController extends GetxController {
   List<PersistentBottomNavBarItem> itemsBottomNavigation = [
    PersistentBottomNavBarItem(
        icon:  const Icon(FlutterIslamicIcons.quran2),
        title: "Quran",
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple),
    PersistentBottomNavBarItem(
        icon:  const Icon(FlutterIslamicIcons.tasbih2),
        title: "Tasbih",
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.newspaper),
        title: "Artikel",
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple),
    PersistentBottomNavBarItem(
        icon: const Icon(FlutterIslamicIcons.prayer),
        title: "Doa",
        activeColorPrimary: mainColor,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple),
  ];

  @override
  void onInit() {
    Get.put(HomeController());
    Get.put(BeritaController());
    Get.put(TasbihController());
    Get.put(DoaController());
    super.onInit();
  }
}
