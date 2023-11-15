import 'package:flutter/material.dart';
import 'package:netflix/core/downlod/api_servies.dart/api.dart';
import 'package:netflix/core/downlod/trend_movie.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/core/new_hot/New_and_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/api_every_one_watching.dart';
import 'package:netflix/core/new_hot/api_new_hot_comingsoon.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentaion/home/widget/movie_card_list.dart';
import 'package:netflix/presentaion/search/widget/searc_title.dart';

class MainMovieCard extends StatefulWidget {
  final String title;
  MainMovieCard({
    // required this.posterlis,
    // required this.index,
    super.key,
    required this.title,
    // required this.snapshot,
  });
  // final List<String> posterlis;
  // final AsyncSnapshot snapshot;
  // final int index;

  @override
  State<MainMovieCard> createState() => _MainMovieCardState();
}

class _MainMovieCardState extends State<MainMovieCard> {
  late Future<List<Movie>> hometrending;
  late Future<List<NewHot>> getNewAndHot;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hometrending = Api().getTrendingMovie();
    getNewAndHot = NewHotApi().getHotDtils();
  }

  // final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: FutureBuilder(
          future: hometrending,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: SearchTitle(title: widget.title),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  LimitedBox(
                    maxHeight: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          snapshot.data!.length,
                          (index) => MovieListcard(
                              image:
                                  '${imgeUrl}${snapshot.data![index].posterpath}'
                              // inedx: index,
                              )),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
