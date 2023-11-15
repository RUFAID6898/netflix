import 'package:flutter/material.dart';
import 'package:netflix/core/downlod/api_servies.dart/api.dart';
import 'package:netflix/core/downlod/trend_movie.dart';

class MovieListcard extends StatelessWidget {
  MovieListcard({
    super.key,
    required this.image,
    //  required this.inedx
  });

  String image;
  // final int inedx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
            color: Colors.red,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

// @override void initState() {
//     // TODO: implement initState
//     super.initState();
//     hometrending = Api().getTrendingMovie();
//   }