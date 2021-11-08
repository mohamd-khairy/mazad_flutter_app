import 'package:flutter/material.dart';
import 'package:plant_app/screens/register/components/body_register.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [BodyRegister(size: size)],
      ),
    );
  }
}
