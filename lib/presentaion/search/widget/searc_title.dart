import 'package:flutter/material.dart';

class SearchTitle extends StatelessWidget {
  SearchTitle({
    required this.title,
    super.key,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        // textAlign: TextAlign.start,
      ),
    );
  }
}
