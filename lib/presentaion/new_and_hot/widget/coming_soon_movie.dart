import 'package:flutter/material.dart';
// import 'package:netflix/core/colors/new_hot/New_and_hot_comingsoon.dart';
// import 'package:netflix/core/colors/new_hot/api_new_hot.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/core/new_hot/New_and_hot_comingsoon.dart';
import 'package:netflix/core/new_hot/api_new_hot_comingsoon.dart';
import 'package:netflix/core/strings.dart';

class ComingSoonMovieWidget extends StatefulWidget {
  ComingSoonMovieWidget({
    super.key,
    required this.size,
    // required this.index,
  });

  final Size size;
  // int index;

  @override
  State<ComingSoonMovieWidget> createState() => _ComingSoonMovieWidgetState();
}

class _ComingSoonMovieWidgetState extends State<ComingSoonMovieWidget> {
  late Future<List<NewHot>> getNewAndHot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewAndHot = NewHotApi().getHotDtils();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 50,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 750,
          width: widget.size.width - 50,
          child: FutureBuilder(
              future: getNewAndHot,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: Image.network(
                                '${imgeUrl}${snapshot.data![index].postrpath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Positioned(
                              bottom: 5,
                              left: 5,
                              child: CircleAvatar(
                                radius: 20,
                                child: Icon(Icons.volume_off),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${snapshot.data![index].title}",
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      color: textcolor,
                                    ),
                                    Text('Remind me')
                                  ],
                                ),
                                sizewidth,
                                Column(
                                  children: [
                                    Icon(
                                      Icons.info,
                                      color: textcolor,
                                    ),
                                    Text('Info'),
                                  ],
                                ),
                                sizewidth
                              ],
                            )
                          ],
                        ),
                        const Text(
                          'Coming Soon',
                          style: TextStyle(fontSize: 15),
                        ),
                        sizeheight,
                        Text(
                          '${snapshot.data![index].title} ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        sizeheight,
                        Text(
                          '${snapshot.data![index].overview} ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
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
              }),
        )
      ],
    );
  }
}
