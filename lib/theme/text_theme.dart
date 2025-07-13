import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class PetTrackTextStyle {
  static final subtitleText = GoogleFonts.getFont(
    'Quicksand',
    fontSize: TextSizes.subtitle,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  );

  static final bodyText = GoogleFonts.getFont(
    'Quicksand',
    fontSize: TextSizes.bodyTextSize,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static final headlineText = GoogleFonts.getFont(
    'Quicksand',
    fontSize: TextSizes.headlineTextSize,
    fontWeight: FontWeight.w300,
    color: AppColors.black,
  );
}

class TextSizes {
  static const double subtitle = 14;
  static const double bodyTextSize = 16;
  static const double headlineTextSize = 24;
}
