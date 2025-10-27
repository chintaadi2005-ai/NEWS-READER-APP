import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends ChangeNotifier {
  static const String _themeKey = 'is_dark_mode';
  final SharedPreferences _prefs;
  bool _isDarkMode;

  ThemeService._(this._prefs)
      : _isDarkMode = _prefs.getBool(_themeKey) ?? false;

  // Singleton instance
  static ThemeService? _instance;

  static Future<ThemeService> getInstance() async {
    if (_instance == null) {
      final prefs = await SharedPreferences.getInstance();
      _instance = ThemeService._(prefs);
    }
    return _instance!;
  }

  bool get isDarkMode => _isDarkMode;

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _prefs.setBool(_themeKey, _isDarkMode);
    notifyListeners();
  }

  // Light theme
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.indigo,
      brightness: Brightness.light,
    );
  }

  // Dark theme
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.indigo,
      brightness: Brightness.dark,
    );
  }
}
