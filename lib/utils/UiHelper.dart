import 'package:flutter/cupertino.dart';

class UiHelper {
  static CustomImage({required String img}) {
    return Image.asset(
      "assets/images/$img",
      height: 300,
      width: 300,
      scale: 1.5,
      fit: BoxFit.fitWidth,
    );
  }

  static CustomTitleTxt({
    required String title,
    required Color color,
    required FontWeight fontWeight,
    String? fontFamily,
    required double fontSize,
  }) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? "regular",
        color: color,
      ),
    );
  }
}
