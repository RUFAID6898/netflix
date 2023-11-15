import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/shortwidget.dart';
import 'package:netflix/presentaion/search/widget/search_id_widgets.dart';
import 'package:netflix/presentaion/search/widget/search_result_widget.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResultWidget(),
                )),
            style: const TextStyle(color: Colors.white),
            suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                color: Colors.grey),
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          sizeheight,
          Expanded(child: SearchIdWidget())
          // Expanded(child: SearchResultWidget())
        ],
      )),
    );
  }
}
