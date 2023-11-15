import 'package:flutter/material.dart';
import 'package:netflix/presentaion/fast_lauhh/widgets/video_list_ithem.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
      scrollDirection: Axis.vertical,
      children: List.generate(
          10,
          (index) => VideoListItem(
                // indexx: index,
                index: index,
              )),
    )));
  }
}
