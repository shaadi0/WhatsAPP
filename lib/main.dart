import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';

void main() => runApp(const WhatsAppApp());

class WhatsAppApp extends StatelessWidget {
  const WhatsAppApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF008069),
          secondary: const Color(0xFF25D366),
          surface: Colors.white,
          background: const Color(0xFFF0F2F5),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
