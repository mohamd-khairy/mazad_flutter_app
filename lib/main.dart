import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/details_screen.dart';
import 'package:plant_app/screens/home/home_screen.dart';
import 'package:plant_app/screens/loading.dart';
import 'package:plant_app/screens/login/login_screen.dart';
import 'package:plant_app/screens/register/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        'home': (context) => HomeScreen(),
        'login': (context) => Login(),
        'register': (context) => Register(),
        'details': (context) => DetailsScreen()
      },
    );
  }
}
