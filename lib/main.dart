import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main_navigation.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp iOS',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
      theme: ThemeData(
        primaryColor: Colors.green,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF25D366), // WhatsApp green
          primary: const Color(0xFF25D366),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        dividerColor: Colors.grey[200],
        fontFamily: '.SF Pro Text', // iOS system font
      ),
    );
  }
}
