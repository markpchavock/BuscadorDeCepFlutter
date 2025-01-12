import 'package:flutter/material.dart';
import 'pages/cep_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenPage(),
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
          appBarTheme: AppBarTheme(color: Colors.blue),
          scaffoldBackgroundColor: Colors.yellow),
    );
  }
}
