
import 'package:flutter/material.dart';

class MemoryGameApp extends StatelessWidget {
  const MemoryGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameScreen(),
    );
  }
}

// 1. Создаем модельку Card
class CardModel {
  final Color color;
  bool isOpened = false;
  bool isSolved = false;

  CardModel({required this.color});
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // 2. Создаем массив карточек
  List<CardModel> cards = [
    CardModel(color: Colors.blue),
    CardModel(color: Colors.red),
    CardModel(color: Colors.blue),
    CardModel(color: Colors.red),
  ];

  int errors = 0;
  int? firstSelectedIndex;
  String statusText = "";
  bool canClick = true;

  void onCardTap(int index) {
    // Если кликать нельзя, карточка уже открыта или решена — игнорируем
    if (!canClick || cards[index].isOpened || cards[index].isSolved || errors >= 2) return;

    setState(() {
      cards[index].isOpened = true;

      if (firstSelectedIndex == null) {
        // Это первая карточка в паре
        firstSelectedIndex = index;
      } else {
        // Это вторая карточка, проверяем совпадение
        if (cards[firstSelectedIndex!].color == cards[index].color) {
          // УСПЕХ
          cards[firstSelectedIndex!].isSolved = true;
          cards[index].isSolved = true;
          statusText = "Успешно";
          firstSelectedIndex = null;
        } else {
          // ОШИБКА
          errors++;
          canClick = false;
          statusText = "Ошибка!";
          
          // Даем пользователю полсекунды посмотреть на цвет, потом скрываем
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              cards[firstSelectedIndex!].isOpened = false;
              cards[index].isOpened = false;
              firstSelectedIndex = null;
              canClick = true;
              if (errors >= 2) {
                statusText = "У вас не осталось попыток";
              } else {
                statusText = "";
              }
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Игра: Найти пару")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ошибки: $errors", style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          // 3. Сетка карточек
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              mainAxisSpacing: 10, 
              crossAxisSpacing: 10
            ),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onCardTap(index),
                child: Container(
                  decoration: BoxDecoration(
                    // 4. Закрашиваем, если открыта или решена, иначе серый
                    color: (cards[index].isOpened || cards[index].isSolved)
                        ? cards[index].color
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.help_outline, color: Colors.white)),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          // 5. Текст статуса
          Text(
            statusText,
            style: TextStyle(
              fontSize: 22, 
              fontWeight: FontWeight.bold,
              color: statusText == "Успешно" ? Colors.green : Colors.red
            ),
          ),
        ],
      ),
    );
  }
}