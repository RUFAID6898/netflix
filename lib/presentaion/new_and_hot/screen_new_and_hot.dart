import 'package:flutter/material.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/presentaion/new_and_hot/widget/coming_soon_movie.dart';
import 'package:netflix/presentaion/new_and_hot/widget/every_one_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'New And Hot',
              style: TextStyle(color: textcolor),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: textcolor,
              ),
              sizewidth,
              Container(
                width: 30,
                height: 30,
                color: textcolor,
              )
            ],
            bottom: TabBar(
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                tabs: const [
                  Tab(
                    text: '🍿Comming Soon',
                  ),
                  Tab(
                    text: '👀 Everyones Watching',
                  ),
                ]),
          ),
          body: TabBarView(
              children: [_comingsoon(context), _everyonesWatchinf()])),
    );
  }
}

Widget _comingsoon(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return ComingSoonMovieWidget(size: size);
}

Widget _everyonesWatchinf() {
  return EveryOnesWatchingWidget();
}
