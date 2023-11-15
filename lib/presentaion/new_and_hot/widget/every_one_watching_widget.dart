import 'package:flutter/material.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/core/new_hot/api_every_one_watching.dart';
import 'package:netflix/core/new_hot/every_one_watching.dart';
import 'package:netflix/core/strings.dart';

class EveryOnesWatchingWidget extends StatefulWidget {
  const EveryOnesWatchingWidget({
    super.key,
  });

  @override
  State<EveryOnesWatchingWidget> createState() =>
      _EveryOnesWatchingWidgetState();
}

class _EveryOnesWatchingWidgetState extends State<EveryOnesWatchingWidget> {
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
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
          future: geteveryonewacth,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sizeheight,
                          Text(
                            snapshot.data![index].title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          sizeheight,
                          Text(
                            snapshot.data![index].overview,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: Image.network(
                                  '${imgeUrl}${snapshot.data![index].posterpath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Positioned(
                                bottom: 10,
                                right: 10,
                                child: CircleAvatar(
                                  radius: 20,
                                  child: Icon(Icons.volume_off),
                                ),
                              )
                            ],
                          ),
                          sizeheight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              sizewidth,
                              Column(
                                children: [
                                  Icon(
                                    Icons.share,
                                    color: textcolor,
                                  ),
                                  Text('Share')
                                ],
                              ),
                              sizewidth,
                              Column(
                                children: [
                                  Icon(
                                    color: textcolor,
                                    Icons.add,
                                  ),
                                  Text('My List')
                                ],
                              ),
                              sizewidth,
                              Column(
                                children: [
                                  Icon(
                                    color: textcolor,
                                    Icons.play_arrow,
                                  ),
                                  Text('Play')
                                ],
                              ),
                              sizewidth,
                            ],
                          )
                        ],
                      ));
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
