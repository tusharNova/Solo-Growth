import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShadowSystemApp());
}

/// ShadowSystemApp is the root widget of the application.
/// It applies the dark Solo Leveling aesthetic and sets up typography and routing.
class ShadowSystemApp extends StatelessWidget {
  const ShadowSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShadowSystem',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBackground,
        primaryColor: kNeonBlue,
        colorScheme: const ColorScheme.dark(
          primary: kNeonBlue,
          secondary: kNeonPurple,
          surface: kCardBg,
        ),
        textTheme: GoogleFonts.rajdhaniTextTheme(
          ThemeData.dark().textTheme,
        ).apply(
          bodyColor: kTextPrimary,
          displayColor: kTextPrimary,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackground,
          elevation: 0,
          iconTheme: IconThemeData(color: kNeonBlue),
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
