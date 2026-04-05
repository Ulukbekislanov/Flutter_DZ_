import 'package:flutter/material.dart';
import 'package:flutter_application_1/detailsScreen.dart';
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final String title = 'Item ${index + 1}'; 
          final String description = 'Описание элемента ${index + 1}'; 

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.article),
              title: Text(title),
              subtitle: Text(description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      title: title,
                      description: description,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}