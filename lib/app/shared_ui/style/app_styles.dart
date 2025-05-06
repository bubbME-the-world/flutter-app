import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

// TextStyle
TextStyle primaryRegularTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.primary,
  fontWeight: FontWeight.w400,
);

TextStyle primaryMediumTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.primary,
  fontWeight: FontWeight.w500,
);

TextStyle primarySemiBoldTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.primary,
  fontWeight: FontWeight.w600,
);

TextStyle primaryBoldTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.primary,
  fontWeight: FontWeight.w700,
);

TextStyle blackRegularTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.black,
  fontWeight: FontWeight.w400,
);

TextStyle blackMediumTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.black,
  fontWeight: FontWeight.w500,
);

TextStyle blackSemiBoldTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.black,
  fontWeight: FontWeight.w600,
);

TextStyle blackBoldTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.black,
  fontWeight: FontWeight.w700,
);

TextStyle whiteRegularTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.white,
  fontWeight: FontWeight.w400,
);

TextStyle whiteMediumTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.white,
  fontWeight: FontWeight.w500,
);

TextStyle whiteSemiBoldTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.white,
  fontWeight: FontWeight.w600,
);

TextStyle whiteBoldTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.white,
  fontWeight: FontWeight.w700,
);

TextStyle greyRegularTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.grey,
  fontWeight: FontWeight.w400,
);

TextStyle greyMediumTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.grey,
  fontWeight: FontWeight.w500,
);

TextStyle greySemiBoldTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.grey,
  fontWeight: FontWeight.w600,
);

TextStyle greyBoldTextStyle = GoogleFonts.mPlusRounded1c(
  color: AppColors.grey,
  fontWeight: FontWeight.w700,
);

TextStyle hintRegularTextStyle = GoogleFonts.mPlusRounded1c(
  fontWeight: FontWeight.w400,
  color: AppColors.hint,
);

TextStyle hintMediumTextStyle = GoogleFonts.mPlusRounded1c(
  fontWeight: FontWeight.w500,
  color: AppColors.hint,
);

TextStyle hintSemiBoldTextStyle = GoogleFonts.mPlusRounded1c(
  fontWeight: FontWeight.w600,
  color: AppColors.hint,
);

TextStyle hintBoldTextStyle = GoogleFonts.mPlusRounded1c(
  fontWeight: FontWeight.w700,
  color: AppColors.hint,
);

TextStyle blackSansitaRegularTextStyle = GoogleFonts.sansita(
  color: AppColors.black,
);

Widget showLoading = Center(
  child: SizedBox(
    width: 24.0,
    height: 24.0,
    child: Platform.isIOS
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 2.0,
          ),
  ),
);

BoxShadow shadow = const BoxShadow(
  color: Colors.black12,
  offset: Offset(0, 1),
  blurRadius: 4.0,
);

LinearGradient backgroundGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    AppColors.primaryAccent,
    AppColors.primaryAccentSoft,
  ],
);

ColorScheme calenderTheme = const ColorScheme.light(
  primary: AppColors.primary,
  onPrimary: AppColors.white,
  onSurface: AppColors.black, // body text color
);
