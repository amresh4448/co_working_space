// ignore_for_file: unused_element

import 'package:enjoy_co_working_space/app/theme/theme_helper.dart';
import 'package:flutter/material.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeAmber500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.amber500,
      );

  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.hintColor,
      );

  static get bodyLargeBluegray400 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.blueGray400,
      );

  static get bodyLargeOnPrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get bodyLargeff000000 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF000000),
      );

  static get bodyLargeff4c61a6 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF4C61A6),
      );

  static get bodyLargeff8b8787 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFF8B8787),
      );

  static get bodyLargeffff3d3d => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFFFF3D3D),
      );

  static get bodyLargeffffc107 => theme.textTheme.bodyLarge!.copyWith(
        color: Color(0XFFFFC107),
      );

  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 15,
      );

  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static get bodyMediumRed500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.red500,
        fontSize: 15,
      );

  // Display text style
  static get displaySmallff000000 => theme.textTheme.displaySmall!.copyWith(
        color: Color(0XFF000000),
      );

  static get displaySmallff4c61a6 => theme.textTheme.displaySmall!.copyWith(
        color: Color(0XFF4C61A6),
      );

  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18,
      );

  // Headline text style
  static get headlineMediumOnPrimary =>
      theme.textTheme.headlineMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  // Title text style
  static get titleLarge22 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 22,
      );

  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get titleLargePrimary22 => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 22,
      );

  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );

  static get titleMediumPrimaryBold => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );

  static get bodyHintStyle => theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: appTheme.hintColor,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );

  static get bodyMedium_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );

  static get titleMediumOnPrimaryContainerMedium =>
      theme.textTheme.titleMedium!.copyWith(
        // color: theme.colorScheme.onPrimaryContainer,
        color: appTheme.bgColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}
