  import 'package:flutter/material.dart';
import 'package:flutter_application_1/RegststionPage.dart';

  void main() => runApp(RegststionApp());
class RegststionApp extends StatelessWidget{
  const RegststionApp ({super.key});
  
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Регистрация',
  home:RegistrationPage() ,
);
  }
}






















// import 'package:flutter/material.dart';

// void main() => runApp(TelegramBottomSheet());

// class TelegramBottomSheet extends StatelessWidget {
//   TelegramBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BottomSheet',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: Color(0xFF2AABEE),
//         scaffoldBackgroundColor: Colors.grey.shade100,
//       ),
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   void showTelegramBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       isDismissible: true,
//       builder: (context) {
//         return Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 16),
//             Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             SizedBox(height: 16),
//             bottomItem(context, icon: Icons.group_add, text: 'Новая группа'),

//             SizedBox(height: 16),
//             bottomItem(context, icon: Icons.lock, text: 'Новый секретный чат'),

//             SizedBox(height: 16),
//             bottomItem(context, icon: Icons.campaign, text: 'Новый канал'),

//             SizedBox(height: 16),
//             bottomItem(
//               context,
//               icon: Icons.person_add,
//               text: 'Добавить контакт',
//             ),

//             SizedBox(height: 16),
//             bottomItem(context, icon: Icons.qr_code, text: 'QR-Код'),

//             SizedBox(height: 16),
//           ],
//         );
//       },
//     );
//   }

//   Widget bottomItem(
//     BuildContext context, {
//     required IconData icon,
//     required String text,
//   }) {
//     return ListTile(
//       leading: Icon(icon, size: 24),
//       title: Text(text, style: TextStyle(fontSize: 16)),
//       onTap: () {
//         Navigator.pop(context);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('$text выирано'),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Telegram')),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => showTelegramBottomSheet(context),
//         child: Icon(Icons.add),
//       ),
//       body: Center(child: Text('Список чатов', style: TextStyle(fontSize: 24))),
//     );
//   }
// }
