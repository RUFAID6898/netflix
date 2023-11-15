import 'package:flutter/material.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/presentaion/downloads/screen_downlods.dart';
import 'package:netflix/presentaion/fast_lauhh/screen_fast_laugh.dart';
import 'package:netflix/presentaion/home/screen_home.dart';
import 'package:netflix/presentaion/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentaion/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix/presentaion/search/screen_search.dart';
// import 'package:netflix/presentaion/downloads/widgets/main_page/widgets/bottom_nav.dart';
// import 'package:netflix/presentaion/main_page/widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  ValueNotifier screenchangenotifaire = ValueNotifier(0);

  List screen = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownlods(),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: screenchangenotifaire,
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: backgroundcolor,
          body: SafeArea(
            child: screen[value],
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                screenchangenotifaire.value = value;
              },
              currentIndex: screenchangenotifaire.value,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: IconThemeData(color: Colors.white),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.collections), label: 'New &Hot'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download), label: 'downlods'),
              ]),
        );
      },
    );
  }
}
