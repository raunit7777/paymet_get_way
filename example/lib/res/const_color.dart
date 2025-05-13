import 'package:flutter/material.dart';

class AppColor {
  static const kBackgroundColor = Color(0xFFFFFFFF);
  static const kDarkButtonBg = Color(0xFF273546);
  static const kSecondaryColor = Color(0xFF808080);
  static const kSelectItemColor = Color(0xFF000000);
  static const kRedColor = Color(0xFFEd8465d);
  static const kBlueColor = Color(0xFF68B0FF);
  static const kGreenColor = Color(0xFF43CB65);
  static const kGreenPurchaseColor = Color(0xFF2BD0A8);
  static const kToastTextColor = Color(0xFFEEEEEE);
  static const kTextColor = Color(0xFF273242);
  static const kTextLightColor = Color(0xFF000000);
  static const kTextLowBlackColor = Colors.black38;
  static const kStarColor = Color(0xFFEFD358);
  static const kDeepBlueColor = Color(0xFF594CF5);
  static const kTabBarBg = Color(0xFFEEEEEE);
  static const kDarkGreyColor = Color(0xffe161616);
  static const kTextBlueColor = Color(0xFF5594bf);
  static const kTimeColor = Color(0xFF366cc6);
  static const kTimeBackColor = Color(0xFFe3ebf5);
  static const kLessonBackColor = Color(0xFFf8e5d2);
  static const kLightBlueColor = Color(0xFF005bf2);
  static const kFormInputColor = Color(0xFFc7c8ca);
  static const kNoteColor = Color(0xFFbcd2e6);
  static const darkG = Color(0xFF05b571);
  static const kLiveClassColor = Color(0xFF161616);
  static const kSeColor = Color(0xFF18cae3);
  static const iCardColor = Color(0xFFF4F8F9);
  static const lGreen = Color(0xFFF94ebc9);
  static const iLongArrowRightColor = Color(0xFF559595);
  static const b1 = Color(0xFF5f76e4);
  static const b2 = Color(0xFF06f7fcc);
  static const b3 = Color(0xFF00d4ff);
  static const y1 = Color(0xFFe3e17c);
  static const y2 = Color(0xFFdbd994);
  static const y3 = Color(0xFFe6e124);
  static const r1 = Color(0xFFdb7970);
  static const r2 = Color(0xFFe0a49f);
  static const r3 = Color(0xFFe61111);
  static const r4 = Color(0xFFeFFEAEB);
  static const g1 = Color(0xFF046174);
  static const g2 = Color(0xFFbfe3b1);
  static const g3 = Color(0xFF9cdc84);
  static const p1 = Color(0xFF046174);
  static const p2 = Color(0xFF05cdd9);
  static const p3 = Color(0xFF18d1bf);
  static const bg1 = Color(0xFF4e59e7);
  static const bg2 = Color(0xFFcf4880);
  static const bg3 = Color(0xFF191c3f);

  static const kDefaultShadow = BoxShadow(
    offset: Offset(20, 10),
    blurRadius: 20,
    color: Colors.black12,
  );

  static final kDefaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(color: Colors.white, width: 2),
  );

  static final kDefaultFocusInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(color: kBlueColor, width: 2),
  );

  static final kDefaultFocusErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: kRedColor),
    borderRadius: BorderRadius.all(Radius.circular(12.0)),
  );
}
