import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF5A2C),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ваш город: ',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: 'Бишкек',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Поиск
                Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.white70),
                      SizedBox(width: 12),
                      Text(
                        'Введите название товара',
                        style: TextStyle(color: Colors.white38, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Баннер рекламы
                Container(
                  width: double.infinity,
                  height: 145,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF5A2C),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Реклама',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Здесь могла быть\nваша реклама',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.campaign,
                        color: Colors.white54,
                        size: 75,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Индикатор
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF5A2C),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 35,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Категории
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Категории',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Посмотреть все',
                      style: TextStyle(
                        color: Color(0xFFFF5A2C),
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [

                    CategoryItem('Одежда', '👕'),
                    CategoryItem('Недвижимость', '🏠'),
                    CategoryItem('Электроника', '📱'),
                    CategoryItem('Все для дома', '🔧'),
                  ],
                ),
                const SizedBox(height: 35),

                const Text(
                  'Рекомендации',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: 0.68,
                  children: const [
                    ProductCard(
                      image: "images/N1.png",
                      title: 'Наушники Beats by Dre',
                      price: '400 000 W',
                    ),
                    ProductCard(
                      image: 'images/O1.png',
                      title: 'Очки Prada',
                      price: '80 000 W',
                      
                    ),
                    ProductCard(
                      title: 'Наушники Beats by Dre',
                      price: '400 000 W',
                      image: 'images/N1.png',
                    ),
                    ProductCard(
                      image: 'images/O1.png',
                      title: 'Очки Prada',
                      price: '80 000 W',
                      
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
