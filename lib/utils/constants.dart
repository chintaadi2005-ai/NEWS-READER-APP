import 'package:flutter/material.dart';

/// Application-wide constants, colors, and configuration values.
class AppConstants {
  static const String appName = 'News Reader AR';

  /// Duration the splash screen stays visible before navigating to next screen.
  static const Duration splashDelay = Duration(seconds: 2);

  /// Default padding used throughout the app for consistent spacing.
  static const double defaultPadding = 12.0;

  /// List of categories displayed in the app.
  /// Each map includes an [id], [label], and [icon] for the category chip.
  static const List<Map<String, dynamic>> categories = [
    {'id': 'tech', 'label': 'Technology', 'icon': Icons.computer},
    {'id': 'sports', 'label': 'Sports', 'icon': Icons.sports_soccer},
    {'id': 'business', 'label': 'Business', 'icon': Icons.business_center},
    {'id': 'health', 'label': 'Health', 'icon': Icons.health_and_safety},
    {'id': 'entertainment', 'label': 'Entertainment', 'icon': Icons.movie},
  ];
}

/// Color palette used across the News Reader AR app.
/// Keep consistent branding and theming in all screens.
class AppColors {
  static const Color primary = Colors.indigo;
  static const Color accent = Colors.blueAccent;
  static const Color background = Color(0xFFF8F9FA);
  static const Color textPrimary = Colors.black87;
  static const Color textSecondary = Colors.black54;
}
