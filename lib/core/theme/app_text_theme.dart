import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
// This code is copied from https://m2.material.io/design/typography/the-type-system.html#type-scale

final appTextTheme = TextTheme(
  displayLarge: GoogleFonts.roboto(
    fontSize: 112.sp,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  displayMedium: GoogleFonts.roboto(
    fontSize: 70.sp,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  displaySmall: GoogleFonts.roboto(
    fontSize: 56.sp,
    fontWeight: FontWeight.w400,
  ),
  headlineMedium: GoogleFonts.roboto(
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  headlineSmall: GoogleFonts.roboto(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
  ),
  titleLarge: GoogleFonts.roboto(
    fontSize: 23.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  titleMedium: GoogleFonts.roboto(
    fontSize: 19.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  titleSmall: GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.roboto(
    fontSize: 19.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  ),
  bodyMedium: GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  ),
  labelLarge: GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
  ),
  bodySmall: GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  labelSmall: GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  ),
);
