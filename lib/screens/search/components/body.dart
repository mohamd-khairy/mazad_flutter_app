import 'package:flutter/material.dart';
import 'package:plant_app/screens/search/components/header_with_seachbox.dart';
import 'package:plant_app/screens/search/components/search_result.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Container(
      child: ListView(
        children: <Widget>[HeaderWithSearchBox(size: size), SearchResult()],
      ),
    );
  }
}
