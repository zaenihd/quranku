import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextGradient extends StatelessWidget {
  TextGradient(
      {super.key,
      required this.text,
      required this.color1,
      required this.color2,
      this.size,
      this.fontWeight});

  Color color1, color2;
  String text;
  double? size;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [color1, color2],
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: TextStyle(
            fontSize: size ?? 14,
            color: Colors.white,
            fontWeight: fontWeight ?? FontWeight.normal),
      ),
    );
  }
}
