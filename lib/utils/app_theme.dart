import 'package:flutter/material.dart';

class AppTheme {
  // Cores principais para o tema da barbearia
  static const Color primaryColor =
      Color(0xFF1C2B35); // Azul escuro (Focado em sofisticação)
  static const Color secondaryColor =
      Color(0xFF3A5A40); // Verde escuro (Aconchegante)
  static const Color accentColor = Color(0xFF7F9D3E); // Verde oliva (Elegante)
  static const Color backgroundColor =
      Color(0xFFF4F4F4); // Cinza claro (Neutro)

  // Textos
  static const Color textPrimary =
      Color(0xFF2D3142); // Quase preto (para textos principais)
  static const Color textSecondary =
      Color(0xFF6E7889); // Cinza claro (para textos secundários)

  // Estilos de texto
  static TextStyle headingStyle = const TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static TextStyle subheadingStyle = const TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static TextStyle bodyStyle = const TextStyle(
    fontSize: 16.0,
    color: textPrimary,
  );

  // Estilo de tema geral
  static ThemeData get theme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        secondary: secondaryColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
      ),
    );
  }
}
