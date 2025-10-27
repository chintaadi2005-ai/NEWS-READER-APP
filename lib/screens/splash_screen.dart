import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Splash Screen shown when the app launches.
/// Displays app logo, name, and a loading indicator.
/// After [AppConstants.splashDelay], it triggers [onComplete].
class SplashScreen extends StatefulWidget {
  final VoidCallback onComplete;
  const SplashScreen({super.key, required this.onComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate after splash delay
    Timer(AppConstants.splashDelay, widget.onComplete);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ✅ App Logo
            Image.asset(
              'assets/images/app_logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.newspaper,
                color: Colors.white,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),

            // ✅ App Name
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
            ),
            const SizedBox(height: 12),

            // ✅ Loading Indicator
            const CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
