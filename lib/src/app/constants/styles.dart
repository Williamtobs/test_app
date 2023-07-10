import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static TextStyle w300({
    final Color? color,
    final double? size,
    final double? letterSpacing,
  }) =>
      GoogleFonts.lato(
        color: color ?? const Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.w300,
        fontSize: size,
        letterSpacing: letterSpacing,
      );

  static TextStyle w400({
    final Color? color,
    final double? size,
    final double? letterSpacing,
  }) =>
      GoogleFonts.lato(
        color: color ?? const Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.w400,
        fontSize: size,
        letterSpacing: letterSpacing,
      );

  static TextStyle w500({
    final Color? color,
    final double? size,
    final double? letterSpacing,
  }) =>
      GoogleFonts.lato(
        color: color ?? const Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.w500,
        fontSize: size,
        letterSpacing: letterSpacing,
      );

  static TextStyle w600({
    final Color? color,
    final double? size,
    final double? letterSpacing,
  }) =>
      GoogleFonts.lato(
        color: color ?? const Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.w600,
        fontSize: size,
        letterSpacing: letterSpacing,
      );

  static TextStyle w700({
    final Color? color,
    final double? size,
    final double? letterSpacing,
  }) =>
      GoogleFonts.lato(
        color: color ?? const Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.w700,
        fontSize: size,
        letterSpacing: letterSpacing,
      );

  static TextStyle w800({
    final Color? color,
    final double? size,
    final double? letterSpacing,
  }) =>
      GoogleFonts.lato(
        color: color ?? const Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.w800,
        fontSize: size,
        letterSpacing: letterSpacing,
      );
  static TextStyle w900({
    final Color? color,
    final double? size,
    final double? letterSpacing,
  }) =>
      GoogleFonts.lato(
        color: color ?? const Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.w900,
        fontSize: size,
        letterSpacing: letterSpacing,
      );

  static TextStyle bold({
    final Color? color,
    final double? size,
    final double? letterSpacing,
  }) =>
      GoogleFonts.lato(
        color: color ?? const Color.fromRGBO(23, 23, 23, 1),
        fontWeight: FontWeight.bold,
        fontSize: size,
        letterSpacing: letterSpacing,
      );
}
