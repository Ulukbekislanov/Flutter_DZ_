import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String description;

  const DetailsScreen({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isAdded = false;

  void toggleFavorite() {
    setState(() {
      isAdded = !isAdded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description, 
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                // Требование: Менять цвет кнопки [cite: 26]
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAdded ? Colors.green : Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: toggleFavorite,
                icon: Icon(isAdded ? Icons.favorite : Icons.favorite_border),
                // Требование: Менять текст при нажатии [cite: 24, 25]
                label: Text(
                  isAdded ? 'Добавлено в избранное' : 'Добавить в избранное',
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Назад'),
            ),
          ],
        ),
      ),
    );
  }
}
