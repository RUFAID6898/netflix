import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/downlod/trend_movie.dart';
import 'package:netflix/core/home/home_trend.dart';
import 'package:netflix/core/new_hot/New_and_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/every_one_watching.dart';
import 'package:netflix/core/strings.dart';

class MovieSiderDetils extends StatelessWidget {
  final NewHotEveryOneWatchind movie;
  const MovieSiderDetils({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 81, 81, 81),
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              leading: Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(left: 8, top: 8),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              expandedHeight: 500,
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 81, 81, 81),
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(60)),
                  child: Image.network(
                    '${imgeUrl}${movie.posterpath}',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movie.title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    movie.overview,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w200),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
