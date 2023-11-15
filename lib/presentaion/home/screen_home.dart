import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/core/downlod/api_servies.dart/api.dart';
import 'package:netflix/core/downlod/trend_movie.dart';
import 'package:netflix/core/home/api_home.dart';
import 'package:netflix/core/home/home_trend.dart';
import 'package:netflix/core/new_hot/New_and_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/api_every_one_watching.dart';
import 'package:netflix/core/new_hot/api_new_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/every_one_watching.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentaion/home/widget/main_move_carss.dart';
import 'package:netflix/presentaion/home/widget/movie_card_list.dart';
import 'package:netflix/presentaion/home/widget/number_card_widget.dart';
import 'package:netflix/presentaion/home/widget/south_movie.dart';
import 'package:netflix/presentaion/home/widget/trending.dart';
import 'package:netflix/presentaion/movie_detils/home_trending_detils.dart';
import 'package:netflix/presentaion/new_and_hot/widget/every_one_watching_widget.dart';
import 'package:netflix/presentaion/search/widget/searc_title.dart';
import 'package:netflix/presentaion/search/widget/search_result_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  ValueNotifier scrollnitfire = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: scrollnitfire,
        builder: (BuildContext, value, Widget_) {
          return Scaffold(
            body: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollnitfire.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollnitfire.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MovieSider(),
                      ),
                      Trending(title: 'Trending Now'),
                      Padding(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: SearchTitle(
                                  title: 'Top 10 Tv show in India Today'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            LimitedBox(
                              maxHeight: 220,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    10,
                                    (index) => NumberMovieCard(
                                          indexx: index,
                                          index: index,
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TrillerMovie(title: "Thriller movie"),
                      MainMovieCard(title: 'Tens Dramas'),
                      MainMovieCard(
                        title: 'Relesed in the past year',
                      ),
                    ],
                  ),
                  scrollnitfire.value == true
                      ? AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 80,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(
                                    'https://i2.wp.com/www.mobiflip.de/wp-content/uploads/2016/06/Netflix_Icon.jpg?fit=1200%2C791&ssl=1',
                                    width: 50,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                  Row(
                                    children: [
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
                                  )
                                ],
                              ),
                              sizeheight,
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'TV shows',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  sizewidth,
                                  Text(
                                    'Moves',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  sizewidth,
                                  Text(
                                    'Categories',
                                    style: TextStyle(fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      : sizeheight
                ],
              ),
            ),
          );
        });
  }
}

class MovieSider extends StatefulWidget {
  const MovieSider({
    super.key,
  });

  @override
  State<MovieSider> createState() => _MovieSiderState();
}

class _MovieSiderState extends State<MovieSider> {
  late Future<List<NewHotEveryOneWatchind>> getmovie;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmovie = EveryOneWtching().geteveryonewatch();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getmovie,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return LimitedBox(
              maxHeight: 400,
              child: CarouselSlider.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index, realIndex) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieSiderDetils(
                                        movie: snapshot.data![index],
                                      )));
                        },
                        child: Sliders(
                          image:
                              '${imgeUrl}${snapshot.data![index].posterpath}',
                        ),
                      ),
                  options: CarouselOptions(
                    autoPlay: true,
                  )));
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(
            child: const CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class Sliders extends StatelessWidget {
  Sliders({
    required this.image,
    super.key,
  });
  String image;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
          width: double.infinity,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.add,
                      color: textcolor,
                      size: 30,
                    ),
                    Text('My List')
                  ],
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: Text('Play')),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.info,
                      color: textcolor,
                      size: 30,
                    ),
                    Text('Info ')
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
