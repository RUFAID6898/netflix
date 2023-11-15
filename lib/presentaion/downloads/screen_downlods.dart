import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/core/downlod/api_servies.dart/api.dart';
import 'package:netflix/core/downlod/trend_movie.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/core/strings.dart';

class ScreenDownlods extends StatelessWidget {
  ScreenDownlods({super.key});
  List sectons = [section1(), section2()];

  @override
  Widget build(BuildContext context) {
    final size_and_hight = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundcolor,
          title: Text(
            'Downlods',
            style: GoogleFonts.anton(
                color: textcolor, fontWeight: FontWeight.bold),
          ),
          actions: [
            Icon(
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
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => sectons[index],
            separatorBuilder: (context, index) => SizedBox(
                  height: 5,
                ),
            itemCount: sectons.length));
  }
}

class section2 extends StatelessWidget {
  const section2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: Text('set up'),
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Colors.white,
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('see want to do dounlod '),
          ),
        )
      ],
    );
  }
}

class section1 extends StatefulWidget {
  const section1({
    super.key,
  });

  @override
  State<section1> createState() => _section1State();
}

class _section1State extends State<section1> {
  late Future<List<Movie>> trendingMovie;
  @override
  void initState() {
    super.initState();
    trendingMovie = Api().getTrendingMovie();
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   BlocProvider.of<DownloadsBloc>(context)
    //       .add(DownloadsEvent.getDownloadsImages());
    // });
    final size_and_hight = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.settings,
              color: textcolor,
            ),
            sizewidth,
            Text(
              'Smart Dounlods',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
        Text(
          'Indroducing Downlods for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          ' We will downlod a persanalised selaction of\n movies and shows for you.so theres\n always somthing to wacth on your\n device',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        Container(
          width: size_and_hight.width,
          height: size_and_hight.width,
          color: backgroundcolor,
          child: Stack(alignment: Alignment.center, children: [
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 129, 129, 129),
              radius: size_and_hight.width * 0.39,
            ),
            SizedBox(
              child: FutureBuilder(
                future: trendingMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    final data = snapshot.data;
                    return MovieCardWidget(
                        snapshot: snapshot,
                        images: '${imgeUrl}${snapshot.data![2].posterpath}',
                        width: size_and_hight * 0.4,
                        margins: EdgeInsets.only(left: 135, bottom: 50),
                        angls: 20,
                        hight: size_and_hight * 0.58);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(
                child: FutureBuilder(
              future: trendingMovie,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.hasData) {
                  final data = snapshot.data;
                  return MovieCardWidget(
                      snapshot: snapshot,
                      images: '${imgeUrl}${snapshot.data![1].posterpath}',
                      width: size_and_hight * 0.4,
                      margins: EdgeInsets.only(right: 135, bottom: 50),
                      angls: -20,
                      hight: size_and_hight * 0.58);
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )),
            SizedBox(
              child: FutureBuilder(
                future: trendingMovie,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.hasData) {
                    final data = snapshot.data;
                    return MovieCardWidget(
                        snapshot: snapshot,
                        images: '${imgeUrl}${snapshot.data![0].posterpath}',
                        width: size_and_hight * 0.4,
                        margins: EdgeInsets.only(right: 0, bottom: 10),
                        angls: 0,
                        hight: size_and_hight * 0.65);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ]),
        ),
      ],
    );
  }
}

class MovieCardWidget extends StatelessWidget {
  MovieCardWidget(
      {super.key,
      required this.snapshot,
      required this.width,
      required this.margins,
      required this.angls,
      required this.hight,
      required this.images});
  final double angls;
  final EdgeInsets margins;
  final String images;

  final Size hight;
  final Size width;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angls * pi / 180,
      child: Container(
        margin: margins,
        width: width.width,
        height: hight.width,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(images), fit: BoxFit.cover),
            color: backgroundcolor,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
// *o.4
// *0.58