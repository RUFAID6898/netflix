import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/core/new_hot/New_and_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/api_new_hot_comingsoon.dart';
import 'package:netflix/core/strings.dart';
import 'package:netflix/presentaion/home/screen_home.dart';
import 'package:netflix/presentaion/movie_detils/movie_slider_detils.dart';
import 'package:netflix/presentaion/search/widget/searc_title.dart';
import 'package:netflix/presentaion/search/widget/search_result_widget.dart';

class SearchIdWidget extends StatelessWidget {
  SearchIdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchTitle(
            title: 'Top Search',
          ),
          sizeheight,
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => TopSearchTile(
                      index: index,
                    ),
                separatorBuilder: (context, index) => sizeheight,
                itemCount: 30),
          )
        ],
      ),
    );
  }
}

class TopSearchTile extends StatefulWidget {
  final int index;
  TopSearchTile({super.key, required this.index});

  @override
  State<TopSearchTile> createState() => _TopSearchTileState();
}

class _TopSearchTileState extends State<TopSearchTile> {
  late Future<List<NewHot>> getNwAndHot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNwAndHot = NewHotApi().getHotDtils();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: getNwAndHot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomeTrendDetils(movie: snapshot.data![widget.index]),
                  ));
            },
            child: Row(
              children: [
                Container(
                  width: sizes * 0.3,
                  height: 65,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            '${imgeUrl}${snapshot.data![widget.index].postrpath}'),
                        fit: BoxFit.cover),
                  ),
                ),
                sizewidth,
                Expanded(
                    child: Text(
                  snapshot.data![widget.index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: textcolor,
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: backgroundcolor,
                      child: Icon(
                        CupertinoIcons.play_fill,
                        color: Colors.white,
                      ),
                    ),
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
