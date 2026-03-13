import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  String name = 'Islanov Ulukbek';
  int age =22 ;
  String City ='BOSTERI';
  String bio = ' GKNB';
  String hobby ='My hobby is playing football.';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 194, 244, 31),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 243, 5, 5),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/Ulukbek.jpeg'),
            ),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontFamily:'RobotoCondensed-Italic-VariableFont_wght', fontSize: 33, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          

            Text(
              "i`m: $age",
              style: TextStyle(fontFamily:'RobotoCondensed-Italic-VariableFont_wght', fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Text(
              'I`m from $City',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily:'RobotoCondensed-Italic-VariableFont_wght', fontSize: 20, fontWeight: FontWeight.bold),
              
            ),
            Text( bio,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily:'RobotoCondensed-Italic-VariableFont_wght', fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text( hobby,
            textAlign: TextAlign.center,
            style: TextStyle(backgroundColor: const Color.fromARGB(255, 35, 14, 231),fontFamily:'RobotoCondensed-Italic-VariableFont_wght', fontSize: 20, fontWeight: FontWeight.bold,),
            ),

Row(
  mainAxisAlignment: MainAxisAlignment.center, // центрируем все кнопки
  children: [
    IconButton(
      onPressed: () {
        print("Камера нажата");
      },
      icon: Icon(Icons.camera_alt),
      iconSize: 30,
    ),
    SizedBox(width: 15),
    IconButton(
      onPressed: () {
        print("Телефон нажата");
      },
      icon: Icon(Icons.phone),
      iconSize: 30,
    ),
    SizedBox(width: 15),
    ElevatedButton(
      onPressed: () {
        print("Подписка нажата");
      },
      child: Text("Follow"),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 45, 10, 219), 
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    ),
  ],
)


          ],
        ),
      ),
    );
  }
}