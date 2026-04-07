import 'package:flutter/material.dart';
import 'package:flutter_application_1/calendarPage.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({super.key});

  @override
  State<CalendarApp> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  bool isRussian = true;

  void _toggleLanguage() {
    setState(() {
      isRussian = !isRussian;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Календарь',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: CalendarPage(
        onToggleLanguage: _toggleLanguage,
      ),
    );
  }
}