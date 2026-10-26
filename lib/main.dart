import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const Y2KScrapbookApp());
}

class Y2KScrapbookApp extends StatelessWidget {
  const Y2KScrapbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Scrapbook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Courier',
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
      ),
      home: const LoginScreen(),
    );
  }
}
