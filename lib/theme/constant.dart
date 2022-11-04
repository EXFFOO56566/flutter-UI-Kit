import 'package:flutter/material.dart';

class Constant {
  static MaterialRadius buttonRadius =
      MaterialRadius(xs: 4, small: 8, medium: 16, large: 24);
  static MaterialRadius textFieldRadius =
      MaterialRadius(xs: 4, small: 8, medium: 16, large: 24);
  static MaterialRadius containerRadius =
      MaterialRadius(xs: 4, small: 8, medium: 16, large: 24);

  static ColorData softColors = ColorData();

  @Deprecated('message')
  static final Color occur = Color(0xffb38220);
  @Deprecated('message')
  static final Color peach = Color(0xffe09c5f);
  @Deprecated('message')
  static final Color skyBlue = Color(0xff639fdc);
  @Deprecated('message')
  static final Color darkGreen = Color(0xff226e79);
  @Deprecated('message')
  static final Color red = Color(0xfff8575e);
  @Deprecated('message')
  static final Color purple = Color(0xff9f50bf);
  @Deprecated('message')
  static final Color pink = Color(0xffd17b88);
  @Deprecated('message')
  static final Color brown = Color(0xffbd631a);
  @Deprecated('message')
  static final Color blue = Color(0xff1a71bd);
  @Deprecated('message')
  static final Color green = Color(0xff068425);
  @Deprecated('message')
  static final Color yellow = Color(0xfffff44f);
  @Deprecated('message')
  static final Color orange = Color(0xffFFA500);
}

class ColorData {
  final Color star = Color(0xffFFC233);

  final ColorGroup pink = ColorGroup(Color(0xffFFC2D9), Color(0xffF5005E));
  final ColorGroup violet = ColorGroup(Color(0xffD0BADE), Color(0xff4E2E60));
  final ColorGroup blue = ColorGroup(Color(0xffADD8FF), Color(0xff004A8F));
  final ColorGroup green = ColorGroup(Color(0xffAFE9DA), Color(0xff165041));
  final ColorGroup orange = ColorGroup(Color(0xffFFCEC2), Color(0xffFF3B0A));

  final List<ColorGroup> list = [];

  ColorData() {
    list.addAll([pink, violet, blue, green, orange]);
  }
}

class ColorGroup {
  final Color color, onColor;

  ColorGroup(this.color, this.onColor);
}

class MaterialRadius {
  late double xs, small, medium, large;

  MaterialRadius(
      {this.xs = 4, this.small = 8, this.medium = 16, this.large = 24});
}
