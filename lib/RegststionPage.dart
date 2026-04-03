import 'package:flutter/material.dart';
import 'package:flutter_application_1/resultPage.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final surNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    loginController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }




  void submitForm() {
    if (_formKey.currentState!.validate()) {


      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Подтверждение'),
            content: Text(
              'Имя: ${nameController.text}\n'
              'Фамилия: ${surNameController.text}\n'
              'Телефон: ${phoneController.text}\n'
              'Email: ${emailController.text}\n'
              'Логин: ${loginController.text}\n\n'
              'Все данные верны?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: const Text('Отмена'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); 
                  // Показываем SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Успешно зарегистрирован')),
                  );
                  // Переход на экран с результатом
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResultPage(
                        name: nameController.text,
                        surName: surNameController.text,
                        phone: phoneController.text,
                        email: emailController.text,
                        login: loginController.text,
                        password: passwordController.text,
                        repeatPassword: repeatPasswordController.text,
                      ),
                    ),
                  );
                },
                child: const Text('ОК'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                controller: nameController,
                label: 'Имя',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя';
                  }
                  if (!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
                    return 'Только буквы';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: surNameController,
                label: 'Фамилия',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите фамилию';
                  }
                  if (!RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(value)) {
                    return 'Только буквы';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: phoneController,
                label: 'Телефон',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите телефон';
                  }
                  if (!RegExp(r'^\+?[0-9]+$').hasMatch(value)) {
                    return 'Только цифры и +';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: emailController,
                label: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите Email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Введите корректный Email';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: loginController,
                label: 'Логин',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите логин';
                  }
                  if (!RegExp(r'^[a-zA-Zа-яА-Я0-9]+$').hasMatch(value)) {
                    return 'Только буквы и цифры';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: passwordController,
                obscureText: true,
                label: 'Пароль',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (!RegExp(r'^(?=.*[a-zA-Zа-яА-Я])(?=.*\d)[a-zA-Zа-яА-Я\d]+$')
                      .hasMatch(value)) {
                    return 'Пароль должен содержать буквы и цифры';
                  }
                  if (value.length < 8) {
                    return 'Пароль должен быть не меньше 8 символов';
                  }
                  return null;
                },
              ),
              buildTextField(
                controller: repeatPasswordController,
                obscureText: true,
                label: 'Повтор пароля',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Повторите пароль';
                  }
                  if (value != passwordController.text) {
                    return 'Пароли не совпадают';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitForm,
                  child: const Text('Зарегистрироваться'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }
}