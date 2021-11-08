import 'package:flutter/material.dart';
import 'package:plant_app/screens/login/components/body_login.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [BodyLogin(size: size)],
      ),
    );
  }
}
