import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String surName;
  final String phone;
  final String email;
  final String login;
  final String password;
  final String repeatPassword;

  ResultPage ({
  super.key, required this.name, required this.surName, required this.phone, required this.email, required this.login, required this.password, required this.repeatPassword});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Данные пользователя'),),
    body: Padding(padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Имя: $name'),
        Text('Фамилия: $surName'),
        Text('Номеи телефона: $phone'),
        Text('email: $email'),
        Text('Логин: $login'),


      ],
    ),),
    );
  }


}