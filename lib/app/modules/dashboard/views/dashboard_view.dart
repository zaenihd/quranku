import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:quranku/app/modules/berita/views/berita_view.dart';
import 'package:quranku/app/modules/doa/views/doa_view.dart';
import 'package:quranku/app/modules/home/views/home_view.dart';
import 'package:quranku/app/modules/tasbih/views/tasbih_view.dart';
import 'package:quranku/theme/theme.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);
  DateTime? currentBackPressTime;

  Future<bool> showExitPopup() async {
    return await showDialog(
          context: Get.context!,
          builder: (context) => AlertDialog(
            title: const Text('Apakah anda yakin?'),
            content: const Text('Keluar dari Aplikasi?'),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Tidak'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Ya'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: showExitPopup,
      child: PersistentTabView(
        hideNavigationBar: false,

        context,
        controller: PersistentTabController(initialIndex: 0),
        screens: const [
          HomeView(),
          TasbihView(),
          BeritaView(),
          DoaView(),
        ],
        onItemSelected: (value) {},
        items: controller.itemsBottomNavigation,
        // pageTransitionAnimation: PageTransitionAnimation.cupertino,
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style8, // Choose the nav bar style with this property.
      ),
    ));
  }
}
