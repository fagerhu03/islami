import 'package:flutter/material.dart';
import 'package:islami/home/home.dart';
import 'package:islami/home/widgets/quran_widget/sura_details_screen.dart';
import 'package:islami/onboarding_screen.dart';
import 'package:islami/thems/app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },

      theme: ThemeData(
        fontFamily: 'janna',
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.textOnPrimary,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textPrimary),
          bodyMedium: TextStyle(color: AppColors.textSecondary),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.accent,
          error: AppColors.error,
        ),
      ),
    );
  }
}
