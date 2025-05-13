import 'package:flutter/material.dart';
import 'const_color.dart';

Widget customText({
  required String text,
  Color color = AppColor.kDeepBlueColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
  double fontSize = 10,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: TextStyle(
      color: color,
      fontFamily: "RobotoSerif_28pt",
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}

Widget elementsBold({
  required String text,
  Color color = AppColor.kSelectItemColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
}

Widget elementsMedium({
  required String text,
  Color color = AppColor.kSelectItemColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
}

Widget elementsSmall({
  required String text,
  Color color = AppColor.kSelectItemColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

Widget tittleBold({
  required String text,
  Color color = AppColor.kSelectItemColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
}

Widget tittleMedium({
  required String text,
  Color color = AppColor.kSelectItemColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}

Widget tittleSmall({
  required String text,
  Color color = AppColor.kSelectItemColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

Widget headingBold({
  required String text,
  Color color = AppColor.kSelectItemColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
}

Widget headingMedium({
  required String text,
  Color color = AppColor.kSelectItemColor,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}

// Heading style with small text and customizable properties
Widget headingSmall({
  required String text,
  Color color = AppColor.bg3,
  TextAlign textAlign = TextAlign.start,
  int? maxLines,
}) {
  return customText(
    text: text,
    color: color,
    textAlign: textAlign,
    maxLines: maxLines,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
}
