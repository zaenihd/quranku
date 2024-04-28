import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quranku/widget/text/txt.dart';

// ignore: must_be_immutable
class ButtonCostum extends StatelessWidget {
  ButtonCostum(
      {Key? key,
      required this.title,
      this.navigation = true,
      required this.onPressed,
      this.margin,
      required this.color})
      : super(key: key);

  String title;
  Function() onPressed;
  bool navigation;
  Color color;
  EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      height: 45,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          child: Txt(
            text: title,
            weight: FontWeight.bold,
            color: Colors.white,
          )),
    );
  }
}
