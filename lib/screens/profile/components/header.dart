import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plant_app/services/user_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants.dart';

class Header extends StatefulWidget {
  const Header({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool loginCheck = false;
  Object user;
  String userName;
  String userImage;

  void _checkLogin() async {
    String token = await getToken();
    userName = await getUserName();
    userImage = await getUserImage();

    setState(() {
      if (token == '') {
        loginCheck = true;
      } else {
        loginCheck = false;
      }
    });
  }

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loginCheck
        ? Text('')
        : Container(
            margin: EdgeInsets.only(bottom: kDefaultPadding),
            // It will cover 20% of our total height
            height: widget.size.height * 0.2,
            child: Stack(
              children: <Widget>[
                Container(
                  height: widget.size.height * 0.2,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          child: userImage != null
                              ? Image.network("$userImage",
                                  width: 120, height: 120, fit: BoxFit.fill)
                              : Text(''),
                        )),
                        Text(
                          '$userName',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
