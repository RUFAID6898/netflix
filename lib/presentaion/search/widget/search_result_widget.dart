import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/home/api_home.dart';
import 'package:netflix/core/home/home_trend.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentaion/search/widget/searc_title.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  late Future<List<HomeMovie>> getsearch;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsearch = HomeApi().getterndhome();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getsearch,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
            child: Column(
              children: [
                CupertinoSearchTextField(
                    style: const TextStyle(color: Colors.white),
                    suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                        color: Colors.grey),
                    backgroundColor: Colors.grey.withOpacity(0.4),
                    prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.grey,
                        ))),
                SearchTitle(title: 'Movie & TV'),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.5,
                    children: List.generate(
                        snapshot.data!.length,
                        (index) => MovieCard(
                              image:
                                  '${imgeUrl}${snapshot.data![index].poster}',
                            )),
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class MovieCard extends StatelessWidget {
  MovieCard({super.key, required this.image});
  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}
