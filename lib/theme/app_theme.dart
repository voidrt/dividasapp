import 'package:dividas/theme/paddings.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_theme.dart';

class DividasAppTheme {
  static final themeData = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.background,
      onSurfaceVariant: AppColors.backgroundWhite,
      onSurface: AppColors.onBackground,
      inverseSurface: AppColors.black,
      shadow: AppColors.darkGrey,
    ),
    textTheme: TextTheme(
      labelMedium: PetTrackTextStyle.subtitleText,
      bodyMedium: PetTrackTextStyle.bodyText,
      headlineMedium: PetTrackTextStyle.headlineText,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.darkGrey,
      backgroundColor: AppColors.primary,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    buttonTheme: const ButtonThemeData(splashColor: Colors.transparent),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),

      filled: true,
      fillColor: AppColors.onBackground,
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppPaddings.defaultSize,
        horizontal: AppPaddings.big,
      ),
    ),
    dividerTheme: const DividerThemeData(
      indent: AppPaddings.veryBig,
      endIndent: AppPaddings.veryBig,
      thickness: 1,
    ),
  );
}
