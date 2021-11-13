import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding / 2,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            color: ModalRoute.of(context).settings.name == 'home'
                ? kPrimaryColor
                : kSecondColor,
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: ModalRoute.of(context).settings.name == 'search'
                ? kPrimaryColor
                : kSecondColor,
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            color: ModalRoute.of(context).settings.name == 'profile'
                ? kPrimaryColor
                : kSecondColor,
            onPressed: () {
              Navigator.pushNamed(context, 'profile');
            },
          ),
        ],
      ),
    );
  }
}
