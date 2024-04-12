import 'package:flutter/material.dart';

class AppFont extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final List<Shadow>? shadows;
  final int? maxLine;

  const AppFont(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.shadows,
    this.maxLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        shadows: shadows,
      ),
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: maxLine == null ? null : TextOverflow.ellipsis,
    );
  }
}
