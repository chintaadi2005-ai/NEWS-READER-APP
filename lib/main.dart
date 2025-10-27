import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'services/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.getInstance();

  runApp(
    ChangeNotifierProvider.value(
      value: themeService,
      child: const NewsReaderApp(),
    ),
  );
}

class NewsReaderApp extends StatelessWidget {
  const NewsReaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'News Reader AR',
          debugShowCheckedModeBanner: false,
          theme: themeService.lightTheme,
          darkTheme: themeService.darkTheme,
          themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const App(),
        );
      },
    );
  }
}
