import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;
  final bool showLogo;

  const AuthBackground({
    super.key,
    required this.child,
    this.showLogo = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGreen,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showLogo) ...[
                      const Text(
                        'study.do',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Upgrade your skills and be knowledgeable by watching videos anytime, anywhere, and any platform with study.do',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ] else ...[
                      // Placeholder for illustrations in other screens
                      const Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.lightbulb_outline, color: Colors.white30, size: 60),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                padding: const EdgeInsets.all(32),
                child: SingleChildScrollView(child: child),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
