import 'package:flutter/material.dart';

import 'theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900,
      );

  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: appTheme.black900.withOpacity(0.1),
      );

  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue300,
      );

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray100,
      );

  static BoxDecoration get fillIndigo => BoxDecoration(
        color: appTheme.indigo50,
      );

  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  static BoxDecoration get fillRedA => BoxDecoration(
        color: appTheme.redA20001,
      );

  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );

  static BoxDecoration get fillSkyBlueContainer => BoxDecoration(
        color: appTheme.skyBlue,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.075),
            spreadRadius: 0,
            blurRadius: 16,
            // offset: Offset(
            //   0,
            //   3,
            // ),
          ),
        ],
      );

  static BoxDecoration get outlineOnPrimary => BoxDecoration(
        color: appTheme.gray100,
        border: Border.all(
          color: theme.colorScheme.onPrimary,
          width: 1,
        ),
      );

  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.07),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              5,
            ),
          ),
        ],
      );

  // White decorations
  static BoxDecoration get white => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );

  static BoxDecoration get whiteBottom => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.07),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(
              5,
              0,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder24 => BorderRadius.circular(
        24,
      );

  static BorderRadius get circleBorder30 => BorderRadius.circular(
        30,
      );

  static BorderRadius get circleBorder40 => BorderRadius.circular(
        40,
      );

  // Custom borders
  static BorderRadius get customBorderTL12 => BorderRadius.vertical(
        top: Radius.circular(12),
      );

  static BorderRadius get customBorderTL20 => BorderRadius.vertical(
        top: Radius.circular(20),
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12,
      );

  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16,
      );

  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20,
      );

  static BorderRadius get roundedBorder48 => BorderRadius.circular(
        48,
      );

  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        6,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
