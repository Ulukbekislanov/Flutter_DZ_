import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page.dart';

void main() {
  runApp(const MarketplaceApp());
}

class MarketplaceApp extends StatelessWidget {
  const MarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marketplace UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}
