import 'package:flutter/material.dart';

class AppColors {
  // ── Colores existentes ──────────────────────────────────────────
  static const Color primaryGreen = Color(0xFF4B7B6D);
  static const Color backgroundGreen = Color(0xFFE3E6A5F); // tu valor original
  static const Color lightGreen = Color(0xFFE9F0EE);
  static const Color white = Colors.white;
  static const Color greyText = Color(0xFF757575);
  static const Color inputBackground = Color(0xFFE9F0EE);

  // ── Colores nuevos (AddProductPage) ────────────────────────────
  static const Color backgroundLight = Color(
    0xFFF7FAF7,
  ); // fondo general de la pantalla
  static const Color sectionLabel = Color(
    0xFF2D6A4F,
  ); // texto de etiquetas de sección
  static const Color dividerGreen = Color(0xFFE8F0E8); // líneas divisoras
  static const Color borderGreen = Color(
    0xFFD8E8D8,
  ); // bordes de inputs y cards
  static const Color photoBorder = Color(
    0xFFB5D4B5,
  ); // borde punteado del foto-picker
  static const Color categorySelected = Color(
    0xFF2D6A4F,
  ); // chip de categoría activo
  static const Color categoryUnsel = Color(
    0xFFF1F5F1,
  ); // chip de categoría inactivo
  static const Color stockHintBg = Color(
    0xFFFFFBEB,
  ); // fondo alerta stock mínimo
  static const Color stockHintBorder = Color(
    0xFFFDE68A,
  ); // borde alerta stock mínimo
  static const Color stockHintText = Color(
    0xFF92400E,
  ); // texto alerta stock mínimo
  static const Color stockHintIcon = Color(
    0xFFB45309,
  ); // ícono alerta stock mínimo
  static const Color toggleActive = Color(0xFF2D6A4F); // switch activado
}
