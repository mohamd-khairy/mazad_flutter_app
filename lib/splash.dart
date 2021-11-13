import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _redirectToHome() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushNamed(context, 'home');
  }

  @override
  void initState() {
    _redirectToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Center(
        child: Text(
          'MaZadoO',
          style:
              TextStyle(color: Colors.white, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
