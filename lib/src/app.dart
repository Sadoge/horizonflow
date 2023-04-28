import 'package:flutter/material.dart';
import 'package:horizonflow/src/core/constants/colors.dart';
import 'package:horizonflow/src/core/constants/text_styles.dart';
import 'package:horizonflow/src/presentation/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HorizonFlow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.accent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(45),
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            textStyle: mediumLight,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
