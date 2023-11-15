import 'package:flutter/material.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/core/new_hot/api_every_one_watching.dart';
import 'package:netflix/core/new_hot/every_one_watching.dart';
import 'package:netflix/core/strings.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  // final int indexx;

  VideoListItem({
    super.key,
    required this.index,
    //  required this.indexx
  });

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late Future<List<NewHotEveryOneWatchind>> getData;
  void initState() {
    // TODO: implement initState
    super.initState();
    getData = EveryOneWtching().geteveryonewatch();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              '${imgeUrl}${snapshot.data![widget.index].posterpath}'),
                          fit: BoxFit.cover)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                            radius: 25,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.volume_off))),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    "${imgeUrl}${snapshot.data![widget.index].posterpath}"),
                              ),
                            ),
                            sizeheight,
                            VideoActionWidget(
                                iconss: Icons.emoji_emotions, title: 'LOL'),
                            sizeheight,
                            VideoActionWidget(
                                iconss: Icons.add, title: 'My list'),
                            sizeheight,
                            VideoActionWidget(
                                iconss: Icons.share, title: 'share'),
                            sizeheight,
                            VideoActionWidget(
                                iconss: Icons.play_arrow, title: 'Play'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData iconss;
  final String title;
  VideoActionWidget({super.key, required this.iconss, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Icon(
            iconss,
            color: Colors.white,
          ),
          Text(title)
        ],
      ),
    );
  }
}
