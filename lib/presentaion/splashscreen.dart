import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix/presentaion/main_page/screen_main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenMainPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
          'https://i2.wp.com/www.mobiflip.de/wp-content/uploads/2016/06/Netflix_Icon.jpg?fit=1200%2C791&ssl=1',
        ),
      ),
    );
  }
}
