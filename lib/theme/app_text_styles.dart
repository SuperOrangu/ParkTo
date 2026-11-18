/* SEZIONE DEDICATA AGLI STILI DI TESTO DELL'APPLICAZIONE */

import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle _inter(double size, FontWeight weight, [Color? color]) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: weight,
        color: color ?? AppColors.ink,
      );

  // Titoli della schermata
  static TextStyle get titleScreen =>
      _inter(30, FontWeight.w700); // Preferiti, Parcheggi vicini
  static TextStyle get titleHome =>
      _inter(28, FontWeight.w700); // Dove parcheggi oggi?
  static TextStyle get titleDetail =>
      _inter(26, FontWeight.w700); // dettaglio blu/giallo
  static TextStyle get section => _inter(18, FontWeight.w600); // Vicino a te

  // Card
  static TextStyle get cardTitle => _inter(16, FontWeight.w600);
  static TextStyle get cardSubtitle =>
      _inter(13, FontWeight.w400, AppColors.muted);

  // Testi generici
  static TextStyle get body => _inter(16, FontWeight.w400);
  static TextStyle get bodyMuted =>
      _inter(15, FontWeight.w400, AppColors.muted);

  // Componenti
  static TextStyle get button => _inter(17, FontWeight.w600, Colors.white);
  static TextStyle get chip => _inter(14, FontWeight.w600);
  static TextStyle get badge => _inter(13, FontWeight.w600, Colors.white);
  static TextStyle get tab => _inter(12, FontWeight.w600);
}
