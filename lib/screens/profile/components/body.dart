import 'package:flutter/material.dart';
import 'package:plant_app/screens/profile/components/buttons.dart';
import 'package:plant_app/screens/profile/components/header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Header(size: size),
        Buttons(size: size),
      ],
    );
  }
}
