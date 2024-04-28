import 'package:flutter/material.dart';
import 'package:quranku/widget/container/cntr.dart';

class CntrImageAssets extends StatelessWidget {
  CntrImageAssets({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
      this.margin,
      this.padding,
      this.radius,
      this.border,
      this.boxShadow,
      this.alignment,
      this.gradient,
      this.ontap,
    this.child
  });

  String imageUrl;
  double height;
  double width;
  Widget? child;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  BorderRadiusGeometry? radius;
  Color? color;
  Gradient? gradient;
  BoxBorder? border;
  List<BoxShadow>? boxShadow;
  AlignmentGeometry? alignment;
  Function()? ontap;


  @override
  Widget build(BuildContext context) {
    return Cntr(
      ontap: ontap,
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      color: color,
      radius: radius,
      gradient: gradient,
      boxShadow: boxShadow,
      alignment: alignment,
      image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      child: child,
    );
  }
}
