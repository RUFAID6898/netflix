// import 'package:flutter/material.dart';

// class BottemNavicationWidget extends StatelessWidget {
//   BottemNavicationWidget({super.key});
//   ValueNotifier indexchangenotifaire = ValueNotifier(0);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: indexchangenotifaire,
//       builder: (context, value, child) {
//         return BottomNavigationBar(
//             currentIndex: 0,
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.black,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.grey,
//             selectedIconTheme: IconThemeData(color: Colors.white),
//             items: const [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.collections), label: 'New &Hot'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.search), label: 'search'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.download), label: 'downlods'),
//             ]);
//       },
//     );
//   }
// }
