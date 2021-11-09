import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  Map item = {};

  @override
  Widget build(BuildContext context) {

    item = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Body(item : item),
    );
  }
}
