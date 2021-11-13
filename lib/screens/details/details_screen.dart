import 'package:flutter/material.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  Map item = {};

  @override
  Widget build(BuildContext context) {
    item = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Item Details'),
      ),
      body: Body(item: item),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
