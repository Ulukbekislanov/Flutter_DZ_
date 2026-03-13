import 'package:flutter/material.dart';
import 'package:flutter_application_1/profilePage.dart';

class ProfileApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  'User profile',
      debugShowCheckedModeBanner: false,
      home: ProfilePage() ,
    );
  }
}