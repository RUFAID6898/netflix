import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:netflix/core/downlod/api_servies.dart/api.dart';
import 'package:netflix/core/new_hot/New_and_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/api_every_one_watching.dart';
import 'package:netflix/core/new_hot/api_new_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/every_one_watching.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentaion/movie_detils/home_trending_detils.dart';

class NumberMovieCard extends StatefulWidget {
  final int index;
  final int indexx;
  NumberMovieCard({
    required this.index,
    required this.indexx,
    super.key,
  });

  @override
  State<NumberMovieCard> createState() => _NumberMovieCardState();
}

class _NumberMovieCardState extends State<NumberMovieCard> {
  late Future<List<NewHotEveryOneWatchind>> geteveryonewacth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geteveryonewacth = EveryOneWtching().geteveryonewatch();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 50,
                height: 200,
              ),
              FutureBuilder(
                  future: geteveryonewacth,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieSiderDetils(
                                    movie: snapshot.data![widget.indexx]),
                              ));
                        },
                        child: Container(
                          height: 250,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${imgeUrl}${snapshot.data![widget.indexx].posterpath}'),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 15,
            child: BorderedText(
              strokeColor: Colors.white,
              child: Text(
                '${widget.index + 1}',
                style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
